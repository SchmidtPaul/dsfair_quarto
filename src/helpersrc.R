# make result chunks green via styles.css
knitr::opts_chunk$set(class.output = "custom-output")

# get raw github URL from local path
get_url_from_path <- function(path) {
  stringr::str_c(here::here("master"),
                 stringr::str_remove(path, here::here())) %>%
    stringr::str_replace(pattern = dirname(here::here()),
                         replacement = "https://raw.githubusercontent.com/SchmidtPaul") %>%
    stringr::str_c('# data is available online:\n', 'path <- "', ., '"') %>%
    cat()
}

# get formatted p-values from anova
getp <- function(ANOVA, term, escape_asterisks = TRUE) {
  tab <- broom::tidy(ANOVA) %>%
    mutate(p_val = insight::format_p(p.value, stars = TRUE)) %>% 
    suppressWarnings()
  
  vec <- set_names(x = tab$p_val, nm = tab$term)
  
  # Check if asterisks should be escaped
  if (escape_asterisks) {
    # Escape asterisks
    return(gsub("*", "\\*", vec[[term]], fixed = TRUE))
  } else {
    return(vec[[term]])
  }
}



