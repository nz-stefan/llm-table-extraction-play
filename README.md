# Extracting a data table from a PDF using an LLM

In this toy example, I explore how an LLM can be used to accelerate a typical data 
science task of extracting data from PDF document. I have chosen a particularly 
tricky PDF document containing a table spanning across multiple pages, repeating
column headers, commas and line breaks in some rows and table captions and explanations
on some of the pages. Extracting this data manually would already be fiddly and 
doing it programmatically using regular expressions and filtering would be even 
harder to achieve. LLMs on the other hand appear to be very well suited to perform
this task. Here I am playing with Anthropic's Claude Sonnet LLM but I got identical
results from OpenAI's GPT5 model.


## Dev environment setup

The development environment of this project is encapsulated in a Docker container.

1. Install Docker. Follow the instructions on https://docs.docker.com/install/
2. Clone the GIT repository   
   `git clone https://github.com/nz-stefan/llm-table-extraction-play`
3. Open file `.Renviron-template` and follow instructions to set up your `OPENAI_API_KEY`.
4. Setup development Docker container  
   `bin/setup-environment.sh`  
   You should see lots of container build messages
5. Spin up the container  
   `bin/start_rstudio.sh`
6. Open `http://localhost:8793` in your browser to start a new RStudio session
7. Install R packages required for this app. Type the following instructions into the R session window of RStudio  
   `renv::restore()`

The installation will take a few minutes. The package library will be installed into 
the `renv/library` directory of the project path.
