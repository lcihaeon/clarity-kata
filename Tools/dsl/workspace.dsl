workspace "Name" "Description" {
    !identifiers hierarchical

    model {
        sa = person "Expert Software Architect"
        dsa = person "Designated Software Architect" {
            tags "Designated SA"
        }
    
        systemA = softwareSystem "Grading copilot system" {
            description "Ingests data for grading"

            test1_ungraded = container "Ungraded Database" {
                tags "Database"
                description "Stores ungraded aptitude test answers"
            }
            test1_graded = container "Graded Database" {
                tags "Database"
                description "Stores graded aptitude test answers"
            }

            wa = container "Grading AI Assistant Web Application" {
                tags "Container"
                description "Web application to assist in grading"
            }

            llm = container "Large Language Model" {
                tags "LLM"
                description "Generates proposals of grading outcomes"
            }

            embedding = container "Embedding Service" {
                description "Converts test answers into vectors"
            }

            ostr = container "Prompt Orchestrator" {
                description "Orchestrates various acitivities that aggregate data necessary for LLM inputs"
            }

            vector_db = container "Vector Database" {
                tags "Database"
                description "Stores vectors of test answers"
            }

            evaluations = container "Evaluations" {
                tags "Database"
                description "Stores evaluations of AI assistant grading outcomes"
            }
        }

        systemB = softwareSystem "System B" {
            description "System B description"
        }
        // sa -> dataIngest.api_gateway "Uses" 

        // systemA.api_gateway -> systemA.test1_grader "Calls" 

        // systemA.test1_db1 -> systemA.test1_grader "Reads from"

        // systemA.test1_grader -> systemA.test1_db2 "Writes to"

        // Data Ingestion
        systemA.test1_graded -> systemA.embedding "Reads from"
        systemA.embedding -> systemA.vector_db "Writes to, 80%"
        systemA.embedding -> systemA.evaluations "Writes to, 20%"

        // Grading Copilot
        systemA.ostr -> systemA.test1_ungraded "Retrieve ungraded answers"
        
    }

    views {
        // systemContext systemA "Diagram1" {
        //     include *
        //     autolayout lr
        // }

        // container systemA "Diagram2" {
        //     include *
        //     autolayout lr
        // }

        container systemA "Ingestion" {
            description "Ingests data for grading and evaluation"
            include systemA.test1_graded
            include systemA.embedding
            include systemA.evaluations
            include systemA.vector_db
            
            autolayout lr
        }

        container systemA "GradingCopilot" {
            description "Generates proposals of grading outcomes"
            include systemA.ostr
            include systemA.llm
            include systemA.wa
            include systemA.test1_ungraded
            include systemA.vector_db
            include systemA.embedding

            autolayout lr
        }

        styles {
            element "Element" {
                color #ffffff
            }
            element "Person" {
                background green
                shape person
            }
            element "Designated SA" {
                background gold
            }
            element "Software System" {
                background blue
            }
            element "Container" {
                background grey
            }
            element "Gateway" {
                height 1000
                width 200
                background grey
            }
            element "Database" {
                shape cylinder
                background grey
            }
        }
    }

    configuration {
        scope softwaresystem
    }

}