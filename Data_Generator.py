import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import os

# --- Configuration ---
NUM_USERS = 500000  # Number of unique users in the system
NUM_EVENTS = 10000000  # Total number of log entries
START_DATE = datetime(2025, 1, 1) # Start date for log generation

# Generate unique user IDs
user_ids = [f'user_{i:04d}' for i in range(NUM_USERS)]

# Generate a list of event timestamps (spread over 30 days)
timestamps = [
    START_DATE + timedelta(days=np.random.randint(0, 30), seconds=np.random.randint(0, 86400))
    for _ in range(NUM_EVENTS)
]
timestamps.sort()

# Generate event types (Weighted distribution to simulate normal traffic)
event_types = np.random.choice(
    ['login_success', 'login_failure', 'password_change', 'admin_access_request'],
    size=NUM_EVENTS,
    # Adjust probabilities to ensure some failures and changes happen
    p=[0.80, 0.10, 0.05, 0.05]
)

# Assign users randomly
users = np.random.choice(user_ids, size=NUM_EVENTS)

# --- Introduce Compromised Users (Target Variable Simulation) ---
# Identify 5% of users (a realistic high-risk sample)
COMPROMISED_PERCENTAGE = 0.05
compromised_users = np.random.choice(user_ids, size=int(NUM_USERS * COMPROMISED_PERCENTAGE), replace=False)

# Artificially increase suspicious activity for compromised users
# This ensures the ML model has something to learn from the features
for i in range(NUM_EVENTS):
    if users[i] in compromised_users:
        if np.random.rand() < 0.3: # 30% chance to replace a benign event with a suspicious one
            event_types[i] = np.random.choice(
                ['login_failure', 'admin_access_request'],
                p=[0.7, 0.3] # Compromised users tend to have failed logins and elevated requests
            )

# Create the final Raw Events DataFrame
df = pd.DataFrame({
    'event_id': range(1, NUM_EVENTS + 1),
    'user_id': users,
    'timestamp': timestamps,
    'event_type': event_types,
})

# Create the User Target DataFrame (The ground truth for the ML model)
user_target_df = pd.DataFrame({
    'user_id': user_ids,
    'is_compromised': [1 if user in compromised_users else 0 for user in user_ids]
})

# --- Save to CSV Files ---
# 1. Raw Logs (for BigQuery upload)
df.to_csv('raw_security_logs.csv', index=False)
print(f"raw_security_logs.csv created with {NUM_EVENTS} events.")

# 2. Target Table (for BigQuery upload and final join)
user_target_df.to_csv('user_target.csv', index=False)
print(f"user_target.csv created with {NUM_USERS} user records.")

print("\n--- Next Steps ---")
print("1. Upload 'raw_security_logs.csv' to BigQuery table: `security_analysis.raw_events`.")
print("2. Upload 'user_target.csv' to BigQuery table: `security_analysis.user_target`.")