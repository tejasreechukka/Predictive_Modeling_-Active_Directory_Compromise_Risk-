# <h1> Predictive_Modeling_"Active_Directory_Compromise_Risk"</h1>
# <p>This project simulates a security data analyst role, where you use systems data to build a simple risk-scoring model. The complexity lies in the data preparation and advanced SQL aggregation.</p>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Predictive_Modeling_-Active_Directory_Compromise_Risk</title>
  <style>
    body { font-family: Arial, Helvetica, sans-serif; line-height:1.6; max-width:960px; margin:28px auto; color:#222 }
    header,h1 { text-align:left; }
    code { background:#f6f8fa; padding:3px 6px; border-radius:4px; }
    .badge { display:inline-block; padding:4px 8px; background:#eef; border-radius:6px; margin-right:6px; font-size:0.9rem }
    .grid { display:grid; grid-template-columns: 1fr 1fr; gap:18px; align-items:start; }
    .fig { border:1px solid #e6e6e6; padding:10px; border-radius:6px; background:#fff }
    img { max-width:100%; height:auto; display:block; margin:8px 0; }
    nav a { display:inline-block; margin-right:12px; color:#0366d6; text-decoration:none }
    footer { margin-top:36px; color:#555; font-size:0.9rem }
    pre { background:#f6f8fa; padding:12px; overflow:auto; border-radius:6px }
  </style>
</head>
<body>
  <header>
    <h1>Predictive_Modeling_-Active_Directory_Compromise_Risk</h1>
    <p>This repository contains code, sample data, SQL feature queries and a notebook used to build a simple risk-scoring model that estimates Active Directory compromise risk from authentication logs.</p>
    <nav>
      <a href="#data">Data</a> · <a href="#notebook">Notebook</a> · <a href="#images">Images</a> · <a href="#run">Run (Windows)</a> · <a href="#files">Important files</a>
    </nav>
  </header>

  <section id="data">
    <h2>Data and artifacts</h2>
    <ul>
      <li><span class="badge">Raw</span> <code>raw_security_logs.csv</code> — example raw logs</li>
      <li><span class="badge">Targets</span> <code>user_target.csv</code> — target labels / enriched labels</li>
      <li><span class="badge">Scripts</span> <code>Data_Generator.py</code> — synthetic or pre-processing script</li>
      <li><span class="badge">SQL</span> <code>Feature_query.sql</code> — SQL used for feature aggregation</li>
      <li><span class="badge">Notebook</span> <code>dapersonalproject.t (Oct 30, 2025, 9_24_51 AM).ipynb</code> — analysis, feature engineering and modeling</li>
    </ul>
  </section>

  <section id="notebook">
    <h2>Notebook</h2>
    <p>Open the main analysis notebook on GitHub or locally via Jupyter. Click the file name below to open on GitHub:</p>
    <ul>
      <li>
        <a href="dapersonalproject.t%20(Oct%2030%2C%202025%2C%209_24_51%20AM).ipynb">dapersonalproject.t (Oct 30, 2025, 9_24_51 AM).ipynb</a>
      </li>
    </ul>
    <p>The notebook demonstrates data loading from <code>raw_security_logs.csv</code>, feature aggregation using <code>Feature_query.sql</code>, feature engineering with <code>Data_Generator.py</code>, and modeling/evaluation.</p>
  </section>

  <section id="images">
    <h2>Images / Visuals</h2>
    <div class="grid">
      <div class="fig">
        <strong>Feature importance</strong>
        <img src="images/feature_importance.png" alt="Feature importance" />
        <p><code>images/feature_importance.png</code></p>
      </div>
      <div class="fig">
        <strong>Confusion matrix</strong>
        <img src="images/confusion_matrix.png" alt="Confusion matrix" />
        <p><code>images/confusion_matrix.png</code></p>
      </div>
      <div class="fig">
        <strong>Security analysis</strong>
        <img src="images/security_analysis.png" alt="Security analysis" />
        <p><code>images/security_analysis.png</code></p>
      </div>
      <div class="fig">
        <strong>Dataflow / pipeline</strong>
        <img src="images/Dataflow.gif" alt="Dataflow" />
        <p><code>images/Dataflow.gif</code></p>
      </div>
    </div>
  </section>

  <section id="run">
    <h2>How to run locally (Windows)</h2>
    <p>Short steps to reproduce locally:</p>
    <pre><code>git clone &lt;repo-url&gt;
cd Predictive_Modeling_-Active_Directory_Compromise_Risk

python -m venv .venv
.venv\Scripts\activate

pip install -r requirements.txt  # if present

jupyter lab    # or jupyter notebook
</code></pre>
    <p>Open the notebook listed above and run cells in order: data prep &rarr; feature extraction &rarr; modeling &rarr; evaluation.</p>
  </section>

  <section id="files">
    <h2>Important files</h2>
    <ul>
      <li><code>dapersonalproject.t (Oct 30, 2025, 9_24_51 AM).ipynb</code> — analysis notebook</li>
      <li><code>Data_Generator.py</code> — data generation / preprocessing</li>
      <li><code>Feature_query.sql</code> — SQL feature queries</li>
      <li><code>raw_security_logs.csv</code>, <code>user_target.csv</code> — raw and label data</li>
      <li><code>images/</code> — visuals used in the notebook</li>
      <li><code>LICENSE</code> — repository license</li>
    </ul>
  </section>

  <footer>
    <p>Repository owner: <code>Yaswanthv5</code></p>
    <p>Save this document as <code>README.md</code> (or <code>README.html</code>) at repository root to provide clickable links to notebooks and images on GitHub.</p>
  </footer>
</body>
</html>