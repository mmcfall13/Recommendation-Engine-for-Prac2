#this script is based off the reference below
#Mueller, J. P., Massaron, L. (2016). Machine Learning for Dummies. Hoboken, NJ: John Wiley & Sons, Inc.
#this model was going to use the same file used in the SVD model created in python as is shown in the Jupyter notebook


if (!"recommenderlab" %in% rownames(installed.packages()))
      {install.packages("recommenderlab")}
library("recommenderlab")

if (!"irlba" %in% rownames(installed.packages()))
      {install.packages("irlba")}
library("irlba")

if (!"randomForest" %in% rownames(installed.packages()))
      {install.packages("randomForest")}
library("randomForest")

library(readr)
dataset <- read_csv("C:/workfiles/recommendm/svddata.csv")
View(dataset)
#df = as.data.frame(dataset)

print(table(as.vector(as(dataset, "matrix"))))
df1 = data.matrix(dataset1)



summary(rowCounts(dataset))

average_attempts <- colMeans(dataset)

print(average_attempts[11])
#couldnt get colcounts function to work, issues with datatypes being fed
print(colCounts(dataset[,11]))
#same issue with colnames
print(colnames(dataset[,11]))

similar_questions <- similarity(dataset1[, 11], dataset1[,-11], method = "cosine", which = "items")
colnames(similar_questions)[which(similar_questions>0.70)]

#IRLBA implicitly restarting lancozos bidiagonalization algorithm

rating_questions <- dataset[rowCounts(dataset1) > 10, colCounts(dataset1) >50]

rating_questions_norm <- normalize(rating_questions, row=TRUE)

densematrix <- as(rating_questions_norm, "matrix")

densematrix[is.na(densematrix)] <- 0

SVD <- irlba(densematrix, nv=50, nu= 50)

print(attributes(SVD))

print(dim(densematrix))

print(dim(SVD$u))

print(dim(SVD$v))

print(length(SVD$d))

chosen_question <- 45

print(paste("choosen movie: ", colnames(densematrix)[chosen_question]))

answer <- as.factor(as.numeric(densematrix)[, chosen_question])
SVD <- irlba(densematrix[, -chosen_question], nv=50, nu=50)
rotation <- data.frame(questions=colnames(densematrix[, -chosen_question]),SVD$v)

train <- sample(1:length(answer), 500)
user_matrix <- as.data.frame(SVD$u[train,])
target_matrix <- as.data.frame(SVU$u[-train,])
model <- randomForest(answer[train] ~., data=user_matrix, importance=TRUE)

response <- predict(model, newdata=target_matrix, n.trees=model$n.trees)
confusion_matrix <- table(answer[-train], response)
precision <- confusion_matrix[2,2] / sum(confusion_matrix[,2])
recall <- confusion_matrix[2,2] / sum(confusion_matrix[2,])
print(confusion_matrix)
print(paste("Precision: ", round(precision, 3), "Recall: ", round(recall,3)))


varImpPlot(model, n.var=10)

rotation[order(rotation[,2]),1:2]

similarity(rating_questions[,45], rating_questions[,145], method = "cosine", which = "items")

similarity(rating_questions[,45], rating_questions[,82], method = "cosine", which = "items")

