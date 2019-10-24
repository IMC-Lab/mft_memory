vignettes <- read.csv('vignette name matching.xlsx', stringsAsFactors = FALSE)
responses <- read.csv('resultfile_8_mem.xls', stringsAsFactors = FALSE)

responses$old <- responses$vignette %in% vignettes$fulltext
responses$resp <- sapply(responses$resp, function(s) as.numeric(s[1]))
responses$reponse <- apply(responses, 1, function(x) {
  if(x['resp'] == 1) {
    x['choice1']
  } else if (x['resp'] == 2) {
    x['choice2']
  } else if (x['resp'] == 3) {
    x['choice3']
  } else {
    ''
  }
})

responses$correct <- responses$response == responses$correct_answer
print(responses$correct)
