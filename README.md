# clarity-kata

O'Reilly, Architectural Katas: AI-Enabled Architecture

## Team

Name: Clarity
Members: Grace Liao

## Solution Overview

The team leveraged AI to enhance the certification system by focusing on two main areas: aptitude test grading and case study grading. By implementing a Retrieval-Augmented Generation (RAG) architecture, the team aimed to automate and improve the efficiency of these processes.

For aptitude tests, the AI grading copilot uses LLMs to evaluate short answer questions, providing context from similar graded answers to enhance accuracy.

In the case of architecture manual grading, the team recognized the challenge of longer case studies exceeding the context window size of LLMs. To address this, we introduced a summarization step, where the shortened case study answers are sent to the LLM first. This method helps manage prompt overflow and ensures that the AI can provide accurate grading assistance.

Overall, the integration of AI in the certification system aimed to streamline the grading process, reduce manual effort, and improve the accuracy and consistency of evaluations.

## Repository structure

1. Folder "ADR": documented decisions made by team
2. Folder "Requirements": raw requirements received from organizers
3. Folder "Solution-discovery": diagrams, documents and other materials produced in pursue of problem solution
