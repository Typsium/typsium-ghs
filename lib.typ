#let get-language-index(lang)={
  if lang == "en"{0}
  else if lang == "de"{1}
  else{0}
}

#let h-statements = state("h-statements", csv("h.tsv", delimiter: "\t", row-type: dictionary))
#let p-statements = state("p-statements", csv("p.tsv", delimiter: "\t", row-type: dictionary))


#let h-statement(statement)={
 let parsed-statement = if type(statement) == int {
   "H" + str(statement)
  } else if type(statement) == str{
    "H" + statement.replace(" ", "")
    .replace(",", "")
    .replace("-", "")
    .replace("h", "")
    .replace("H", "")
  } else if type(statement) == content{
    "H" + statement.text
    .replace(" ", "")
    .replace(",", "")
    .replace("-", "")
    .replace("h", "")
    .replace("H", "")
  }
  context {
    let lang-index = get-language-index(text.lang)
    h-statements.get()
    .at(lang-index)
    .at(parsed-statement, default: "no hazard statement was found for the provided item: " + repr(statement))
  }
}

#let p-statement(statement)={
  let parsed-statement = if type(statement) == int {
   "P" + str(statement)
  } else if type(statement) == str{
    "P" + statement.replace(" ", "")
    .replace(",", "")
    .replace("-", "")
    .replace("p", "")
    .replace("P", "")
  } else if type(statement) == content{
    "H" + statement.text
    .replace(" ", "")
    .replace(",", "")
    .replace("-", "")
    .replace("p", "")
    .replace("P", "")
  }
  context {
    let lang-index = get-language-index(text.lang)
    p-statements.get()
    .at(lang-index)
    .at(parsed-statement, default: "no hazard statement was found for the provided item: " + repr(statement))
  }
}