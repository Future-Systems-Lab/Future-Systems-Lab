# BI Warehouse Flow Diagram

flowchart TB

RB["Regulatory Bulletins"]
VSR["Vendor Security Reports"]
CU["Compliance Updates"]
SL["Session Logs"]
CE["Consent Events"]
AT["Audit Trails"]
UA["User Activity"]

STAGE["Staging Layer<br>(Cleaning & Validation)"]
EDW["Enterprise Data Warehouse"]

CM["Compliance Mart"]
OM["Operations Mart"]
SQM["Safety & Quality Mart"]

BI["Business Intelligence Dashboards<br>(Descriptive)"]
BA["Business Analytics Tools<br>(Predictive)"]

BIU["BI Users:<br>Operations • Compliance • QA • Vendor Management"]
BAU["BA Users:<br>Analysts • Security Teams • Executives"]

RB --> STAGE
VSR --> STAGE
CU --> STAGE
SL --> STAGE
CE --> STAGE
AT --> STAGE
UA --> STAGE

STAGE --> EDW

EDW --> CM
EDW --> OM
EDW --> SQM
EDW --> BA

CM --> BI
OM --> BI
SQM --> BI

BI --> BIU
BA --> BAU
