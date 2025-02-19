# 3. Model Selection

Date: 2025-02-19

## Status

Accepted

## Context

We need to select appropriate models for our AI assistant, considering the context window size and performance.

## Decision

We will evaluate and select models based on their context window size and estimated word count equivalent. The following models are considered:

| Model Name     | Context Window Size | Estimated Word Count Equivalent* |
|----------------|---------------------|----------------------------------|
| GPT-3          | 2,048 tokens        | 1,536 words                     |
| GTP-3.5-turbo  | 4,096 tokens        | 3,072 words                     |
| GTP-4          | 8,192 tokens        | 6,144 words                     |
| GTP-4-32k      | 32,768 tokens       | 24,576 words                    |
| Llama 2        | 4,096 tokens        | 3,072 words                     |
| Llama 3.1      | 128,000 tokens      | 96,000 words                    |
| Claude 2       | 100,000 tokens      | 75,000 words                    |
| Gemini 1.5 Pro | 2 million tokens    | 1.5 million words               |

Aptitude test answers are shorter compared to that of case studies. When the prompt includes the ungraded answer for aptitude test along with graded answers, a medium-sized context window should suffice in most cases. For this reason, models such as GPT-4-32k, Llama 3.1, Claude 2, and Gemini 1.5 Pro are good candidates to start with.

For case studies, the chance of prompt overflow is higher. So additional techniques are required to solve this problem. One possible solution is to include an additional summarize step. In the summarize step, we only send the case study answers to the LLM. This includes the ungraded case study as well as similar graded case study.

* word count equivalent is calcuated using a 100 token ~= 75 words, according to [openai tokenizer](https://platform.openai.com/tokenizer).

## Consequences

By selecting models with appropriate context window sizes, we can ensure better performance and accuracy for our AI assistant. The summarization step will help manage prompt overflow in case studies.
