# Analysis of potential areas for improvement using Gen AI

## Summary

We assume that the main bottleneck in the current operation lies in the manual grading processes, i.e., aptitude manual grading and architecture manual grading. These two areas appear to fit in the sweet spot for a RAG architecture. Therefore, we will prioritize enhancing these two processes first.

## Services to be Enhanced

1. **Aptitude Test Maintenance Service**
    - **Objective:** Modify aptitude tests.
    - **Proposed Solution:** New data pipeline + automated suggestions.
    - **Details:** 
        - Capture past accepted modifications to aptitude tests to train AI models for making suggestions to SAs.
        - Consider whether Certifiable will benefit more from static rules or purely AI-driven models.

2. **Case Study Maintenance Service**
    - **Objective:** Modify case studies and grading criteria.
    - **Proposed Solution:** New data pipeline + automated suggestions.
    - **Details:** 
        - Add functionality to store accepted SA modifications.
        - Create a new table (case_study_changelog) in the Case Study database to persist the change log.
        - Automated suggestions can come later and should be a lower priority.

3. **Aptitude Test Analysis Service**
    - **Objective:** Analyze aptitude test reports.
    - **Proposed Solution:** New data pipeline + automated suggestions.
    - **Details:** 
        - Add functionality to store accepted SA modifications that can feed into the Aptitude Test Maintenance Service.
        - Create a new table (aptitude_test_changelog) in the Aptitude Test database to persist the change log.
        - Enhance this service in conjunction with the Aptitude Test Maintenance Service to provide a complete feature.

4. **Aptitude Manual Grader**
    - **Objective:** Automate grading of short answer questions.
    - **Proposed Solution:** AI grading assistant powered by RAG.
    - **Details:** 
        - Use LLMs to evaluate short answer questions within the context window size.
        - Pass ungraded candidate answers and similar graded answers as context to the LLM.

5. **Architecture Manual Grader**
    - **Objective:** Automate grading of architecture submissions.
    - **Proposed Solution:** AI grading assistant powered by RAG.
    - **Details:** 
        - Address the challenge of longer case studies exceeding the context window size of LLMs.
        - Implement a summarization step to manage prompt overflow by sending only relevant case study answers to the LLM.
