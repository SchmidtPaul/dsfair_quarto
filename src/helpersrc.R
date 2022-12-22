# make result chunks green via styles.css
knitr::opts_chunk$set(
  class.output = "custom-output"
)

# get raw github URL from local path
get_url_from_path <- function(path) {
  stringr::str_c(here::here("master"),
                 stringr::str_remove(path, here::here())) %>%
    stringr::str_replace(pattern = dirname(here::here()),
                         replacement = "https://raw.githubusercontent.com/SchmidtPaul") %>%
    stringr::str_c('# data is available online:\n','path <- "', ., '"') %>%
    cat()
}

# get formatted p-values from anova
getp <- function(ANOVA, term){
  tab <- broom::tidy(ANOVA) %>% 
    mutate(p_val = insight::format_p(p.value, stars = TRUE))
  
  vec <- set_names(x = tab$p_val, nm = tab$term)
  
  vec[[term]]
}


