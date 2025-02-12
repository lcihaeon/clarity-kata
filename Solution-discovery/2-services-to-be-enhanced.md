# Analysis of potential areas for improvement using Gen AI

Summary:

We assume that the main bottle neck in the current operation lies in the manual grading processes, i.e. aptitude
manual grading and architecture manual grading. And these two areas appear to fit in the sweet spot for a RAG architecture, therefore, we will prioritize enhancing these two processes first.

1. Aptitude Test Maintenance Service [*]
    Modify aptitude tests.

    Proposed solution summary: new data pipeline + automated suggestions

    We assume that the past accepted modifications to aptitude tests were not persisted in the Aptitude test database. If that's the case, the first thing is to capture the modifications so that the data can be 
    used to train AI models to make suggestions to SAs. The AI models to be selected should be chosen from
    a range of models not restricted to just LLMs.

    Another factor to consider is whether Certifiable will benefit more from a set of static rules for modifications, or from purely AI-driven models.

2. Case Study Maintenance Service [*]
    Modify case studies and grading criteria.

    Proposed solution summary: new data pipeline + automated suggestions

    This service should add the functionality to store accepted SA modifications.

    To achieve this, adde another table (case_study_changelog) in the Case Study database, to persist the change log. 
     - case study number (foreign key referencing the case study table) 
     - change_type (one of modification, addition, removal)
     - user
     - status (one of proposed, accepted)
     - modified_timestamp
     - added_timestamp

     Automated suggestions can come later. Should be a lower priority.

3. Aptitude Test Analysis Service [*]
    Analyzes aptitude test reports.

    Proposed solution summary: new data pipeline + automated suggestions

    This service should add the functionality to store accepted SA modifications, that can feed into
    the Aptitude Test Maintenance Service.

    To achieve this, adde another table (aptitude_test_changelog) in the Aptitude Test database, to persist the change log. 
     - aptitude test number (foreign key referencing the aptitude test table)
     - change_type (one of modification, addition, removal)
     - user
     - status (one of proposed, accepted)
     - modified_timestamp
     - added_timestamp

     The enhancement of this service should go hand-in-hand with that of the Aptitude Test Maintenance Service
     to provide a complete feature.

4. Aptitude Manual Grader [*]

    Proposed solution summary: Perfect candidate for RAG. AI grading assistant powered by RAG.

    The short answer questions, we assume, will be within the context window size for most LLMs.
    Ungraded candidate answers are stored in the Aptitude Test Ungraded Database. The ungraded answer
    will be passed to the LLM as context. In addition, to provide additional context to the LLMs,
    we need to search and pass along "similar" graded answers as request context for the LLM to process.

5. Architecture Manual Grader [*]

    Proposed solution summary: AI grading assistant powered by RAG.

    We assume that the length of case studies are much longer than that of the aptitude tests. This may cause problems with the limit of context windows for LLMs. Which could
    further translate into higher costs. More in-depth analysis to follow.
