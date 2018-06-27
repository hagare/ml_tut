# Unsupervised learning the Apriori algorithm

# Load Apriori library
require(arules) # classification algorithm based on association rules 

 data("Adult")

     ## Mine rules.
     rules <- apriori(Adult, parameter = list(support = 0.4))

     ## Select a subset of rules using partial matching on the items
     ## in the right-hand-side and a quality measure
     rules.sub <- subset(rules, subset = rhs %pin% "sex" & lift > 1.3)

     ## Display the top 3 support rules
     inspect(head(rules.sub, n = 3, by = "support"))

     ## Display the first 3 rules
     inspect(rules.sub[1:3])

     ## Get labels for the first 3 rules
     labels(rules.sub[1:3])
     labels(rules.sub[1:3], itemSep = " + ", setStart = "", setEnd="",
       ruleSep = " ---> ")
