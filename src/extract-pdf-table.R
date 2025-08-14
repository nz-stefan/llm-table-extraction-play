##############################################################################################
# Use an LLM to extract a table from a PDF and load it as a dataframe into R.
#
# Author: Stefan Schliebs
# Created: Tue Aug 12 21:47:12 2025
##############################################################################################

library(ellmer)
library(dplyr)


# Config ------------------------------------------------------------------

# path to the PDF file
F_PDF <- "data/facts_and_figures_dnz30-001_updated_dec_2021_v6.pdf"


# Extract table -----------------------------------------------------------

# initialise a chat client
chat <- chat_anthropic(model = "claude-sonnet-4-20250514")

# prepare PDF to be sent to the LLM
pdf_content <- content_pdf_file(F_PDF)

# suitable prompt for the LLM
prompt <- "From the attached PDF, extract the table across pages 1 to 6 into a single CSV 
formatted string. Do not add any other comments or markdown wrappers to your response, 
just respond with the CSV string. Ensure that all text columns are enclosed with a double quote."

# send prompt and PDF to the LLM
response <- chat$chat(prompt, pdf_content)

# load CSV string into a dataframe
d_extracted <- read.csv(textConnection(response)) %>% as_tibble()

View(d_extracted)
