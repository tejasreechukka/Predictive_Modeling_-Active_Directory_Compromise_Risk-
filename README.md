<h1> Predictive_Modeling_"Active_Directory_Compromise_Risk"</h1>
<p>This project simulates a security data analyst role, where you use systems data to build a simple risk-scoring model. The complexity lies in the data preparation and advanced SQL aggregation.</p>

<h2>Executive Summary:</h2>
<h3><b>Objective:</b></h3> <p>To design and implement an end-to-end Machine Learning (ML) solution using advanced SQL feature engineering to proactively identify user accounts at high risk of security compromise.</p>

**Key Results:** The Logistic Regression model achieved a **97% Accuracy Rate** with a **0.02 Risk Rate** (False Negative Rate). This demonstrates the successful creation of a reliable security early warning system capable of focusing investigative resources.

**Actionable Insight:** The user-level analysis confirms that compromised users (peaks in the line graph) are associated with **significantly shorter times since their last event**, indicating anomalous, high-frequency activity typical of a compromised account.

***

### 1. Model Performance and Validation

The model's primary goal was to minimize **False Negatives** (the risk of missing an actual compromise), as this is the costliest error in security.

| Metric | Value | Interpretation |
| :--- | :--- | :--- |<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Predictive_Modeling_&quot;Active_Directory_Compromise_Risk&quot;</title>
</head>
<body>
  <h1>Predictive_Modeling_"Active_Directory_Compromise_Risk"</h1>
  <p>This project simulates a security data analyst role, where you use systems data to build a simple risk-scoring model. The complexity lies in the data preparation and advanced SQL aggregation.</p>

  <h2>Executive Summary:</h2>
  <h3><strong>Objective:</strong></h3>
  <p>To design and implement an end-to-end Machine Learning (ML) solution using advanced SQL feature engineering to proactively identify user accounts at high risk of security compromise.</p>

  <p><strong>Key Results:</strong> The Logistic Regression model achieved a <strong>97% Accuracy Rate</strong> with a <strong>0.02 Risk Rate</strong> (False Negative Rate). This demonstrates the successful creation of a reliable security early warning system capable of focusing investigative resources.</p>

  <p><strong>Actionable Insight:</strong> The user-level analysis confirms that compromised users (peaks in the line graph) are associated with <strong>significantly shorter times since their last event</strong>, indicating anomalous, high-frequency activity typical of a compromised account.</p>

  <hr>

  <h3>1. Model Performance and Validation</h3>
  <p>The model's primary goal was to minimize <strong>False Negatives</strong> (the risk of missing an actual compromise), as this is the costliest error in security.</p>

  <table border="1" cellpadding="4" cellspacing="0">
    <thead>
      <tr>
        <th>Metric</th>
        <th>Value</th>
        <th>Interpretation</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><strong>Accuracy Rate</strong></td>
        <td><strong>0.97 (97%)</strong></td>
        <td>The model correctly classified 97% of all user accounts as either low-risk or high-risk.</td>
      </tr>
      <tr>
        <td><strong>Risk Rate (False Negative Rate)</strong></td>
        <td><strong>0.02 (2%)</strong></td>
        <td>Only 2% of genuinely compromised accounts were missed by the model, proving its high efficacy as an early warning tool.</td>
      </tr>
    </tbody>
  </table>

  <p>The model's high performance validates the initial hypothesis: <strong>Complex behavioral features derived from raw logs are highly predictive of user risk.</strong></p>

  <hr>

  <h3>2. User-Level Analysis: Identifying Anomalies</h3>
  <p>The bar chart, showing <strong>Sum of <code>days_since_last_event</code></strong> and <strong>Sum of <code>is_compromised</code></strong> by <code>user_id</code>, provides the core business justification for the model.</p>

  <ul>
    <li><strong>Bar Height (Days Since Last Event):</strong> For the vast majority of users, this value is high (near 300 days), which is expected if accounts are dormant or used infrequently for administrative tasks.</li>
    <li><strong>Line Peaks (Sum of is_compromised):</strong> The sharp peaks in the line graph indicate the specific users who were confirmed as compromised (<code>is_compromised = 1</code>).</li>
    <li><strong>The Critical Pattern:</strong> Every user identified as compromised (a line peak) corresponds to a user whose <strong>Days Since Last Event</strong> is dramatically <strong>lower</strong> (a corresponding dip in the blue bar).</li>
  </ul>

  <p><strong>Inference:</strong> The feature <code>days_since_last_event</code> is a powerful inverse indicator of risk. A compromised account, likely being controlled by a script or attacker, will generate frequent, recent events, reducing this metric close to zero and confirming the feature's high importance in the prediction phase.</p>

  <hr>

  <h3>3. Actionable Prioritization: The Risk Scatter Plot</h3>
  <p>The scatter plot of <strong>Composite_Risk_Score</strong> vs. <strong>True Positive Count</strong> is designed to create a prioritized security queue.</p>

  <ul>
    <li><strong>True Positive Count (Y-axis):</strong> The number of times a user was correctly flagged as high-risk by the model (<code>is_compromised = 1</code> AND <code>y_pred = 1</code>).</li>
    <li><strong>Composite Risk Score (X-axis):</strong> A custom metric used for transparent ranking (e.g., a weighted average of features like failed logins).</li>
  </ul>

  <p><strong>Actionable Insight:</strong> The cluster of points in the scatter plot identifies the few, highest-risk users. A security analyst should immediately investigate users with a <strong>high Composite_Risk_Score</strong> (e.g., above 3.5) and a <strong>True Positive Count</strong> greater than zero, as these are the model's most confident high-risk predictions.</p>

  <hr>

  <h3>Conclusion and Recommendation</h3>
  <p>This project successfully transforms raw security data into a proactive risk-prediction capability.</p>

  <p><strong>Recommendation to the Security Team:</strong></p>
  <ol>
    <li><strong>Integrate the Model Output:</strong> Directly ingest the model's output (<code>y_pred</code>) into the security alert system.</li>
    <li><strong>Focus on Low <code>days_since_last_event</code>:</strong> Immediately flag any user whose <code>days_since_last_event</code> falls below a one-week threshold (7 days), as the visualization confirms this is a near-certain indicator of anomalous activity.</li>
    <li><strong>Validate the Composite Score:</strong> Use the Composite_Risk_Score as a secondary ranking factor to prioritize users who have multiple risk factors (high failed logins, recent admin requests, etc.) for deeper forensic analysis.</li>
  </ol>
</body>
</html>
| **Accuracy Rate** | **0.97 (97%)** | The model correctly classified 97% of all user accounts as either low-risk or high-risk. |
| **Risk Rate (False Negative Rate)** | **0.02 (2%)** | This is the crucial business metric. Only **2% of genuinely compromised accounts were missed** by the model, proving its high efficacy as an early warning tool. |

The model's high performance validates the initial hypothesis: **Complex behavioral features derived from raw logs are highly predictive of user risk.**

---

### 2. User-Level Analysis: Identifying Anomalies

The bar chart, showing **Sum of days\_since\_last\_event** and **Sum of is\_compromised** by `user_id`, provides the core business justification for the model.

* **Bar Height (Days Since Last Event):** For the vast majority of users, this value is high (near 300 days), which is expected if accounts are dormant or used infrequently for administrative tasks.
* **Line Peaks (Sum of is\_compromised):** The sharp peaks in the line graph indicate the specific users who were confirmed as compromised (`is_compromised = 1`).
* **The Critical Pattern:** Every user identified as compromised (a line peak) corresponds to a user whose **Days Since Last Event** is dramatically **lower** (a corresponding dip in the blue bar).

**Inference:** The feature **`days_since_last_event`** is a powerful inverse indicator of risk. A compromised account, likely being controlled by a script or attacker, will generate frequent, recent events, reducing this metric close to zero and confirming the feature's high importance in the prediction phase.

---

### 3. Actionable Prioritization: The Risk Scatter Plot

The scatter plot of **Composite\_Risk\_Score** vs. **True Positive Count** is designed to create a prioritized security queue.

* **True Positive Count (Y-axis):** This represents the number of times a user was correctly flagged as high-risk by the model (`is_compromised = 1` AND `y_pred = 1`).
* **Composite Risk Score (X-axis):** This is the custom DAX metric (likely a weighted average of features like failed logins, etc.) used for transparent ranking.

**Actionable Insight:** The cluster of points in the scatter plot identifies the few, highest-risk users. A security analyst should immediately investigate users with a **high Composite\_Risk\_Score** (e.g., above 3.5 on the X-axis) and a **True Positive Count** greater than zero, as these are the model's most confident high-risk predictions.

---

### Conclusion and Recommendation

This project successfully transforms raw security data into a proactive risk-prediction capability.

**Recommendation to the Security Team:**

1.  **Integrate the Model Output:** Directly ingest the model's output (`y_pred`) into the security alert system.
2.  **Focus on Low `Days Since Last Event`:** Immediately flag any user whose **`days_since_last_event`** falls below a one-week threshold (7 days), as the visualization confirms this is a near-certain indicator of anomalous activity.
3.  **Validate the Composite Score:** Use the DAX **Composite\_Risk\_Score** as a secondary ranking factor to prioritize users who have multiple risk factors (high failed logins, recent admin requests, etc.) for deeper forensic analysis.