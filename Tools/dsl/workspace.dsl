workspace "Name" "Description" {

    !identifiers hierarchical

    model {
        sa = person "Expert Software Architect"
        dsa = person "Designated Software Architect" {
            tags "Designated SA"
        }
        ss = softwareSystem "Aptitude test grading system" {
            api_gateway = container "API Gateway" {
                tags "Gateway"
                description "Gateway for all API calls"
            }
            test1_grader = container "Manual Grader" {
                tags "Container"
                description "Grades the test"
            }
            test1_db1 = container "Ungraded Database" {
                tags "Database"
                description "Stores ungraded aptitude test answers"
            }
            test1_db2 = container "Graded Database" {
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

            os = container "Prompt Orchestrator" {
                description "Orchestrates various acitivities that aggregate data necessary for LLM inputs"
            }

            vector_db = container "Vector Database" {
                tags "Database"
                description "Stores vectors of test answers"
            }
        }

        sa -> ss.api_gateway "Uses" 

        ss.api_gateway -> ss.test1_grader "Calls" 

        ss.test1_db1 -> ss.test1_grader "Reads from"

        ss.test1_grader -> ss.test1_db2 "Writes to"
        
    }

    views {
        systemContext ss "Diagram1" {
            include *
            autolayout lr
        }

        container ss "Diagram2" {
            include *
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