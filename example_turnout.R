#### METODOS DE INVESTIGACION APLICADA
#### CLASE 2
#### Antonella Bandiera


## Question: How do you measure turnout rates?
## Numerator: Total votes cast
## Denominator??
# 1. Registered votes
# 2. VAP (voting age population)
# 3. VEP (voting elegibile pop)
# VEP = VAP + OVERSEAS - INELIGIBLE

## First let's check what is our working directory, we need to change it to 
## the directory where we have our files

getwd()
setwd("~/Dropbox/Teaching_ITAM/MIA/clase2/")

## Let's input the data

turnout <- read.csv("turnout.csv")
class(turnout)

# Remember every object in R has a class

dim(turnout)
names(turnout)


## Let's look at the first three rows of some variables


turnout[1:3, c("year", "total", "VEP", "VAP", "felons")]


## Each column of the data frame is a vector and you call them using the peso sign


turnout$year


# We can look at particular elements of the vector using brackets

turnout$year[2]


## Create a vector

eighties <- turnout$year[1:5]
eighties

## Remember you can do a lot of things to vectors

eighties + 10

## VAP BASED TURNOUT


VAPtr <- turnout$total / (turnout$VAP + turnout$overseas) * 100
VAPtr

## You can add labels 

names(VAPtr) <- turnout$year

## VEP based turnout

VEPtr <- turnout$total / turnout$VEP * 100
names(VEPtr) <- turnout$year

## Difference between the two turnout rates that we calculated

diff <- VEPtr - VAPtr
names(diff) <- turnout$year
diff


## Self-reported turnout (comparison between VAP and ANES)

diffVAP <- turnout$ANES - VAPtr
summary(diffVAP)

## Comparison between VEP and ANES


diffVEP <- turnout$ANES - VEPtr
summary(diffVEP)


## Presidential vs. mid-term election

turnout$year

## Presidential elections are odd entries of the vector and the last
# Remember you can concatenate with c()

pres <- c(1, 3, 5, 7, 9, 11, 13, 14)
mids <- c(2, 4, 6, 8, 10, 12)


# Years of presidential elections
turnout$year[pres]

# Years of midterm elections
turnout$year[mids]

# Presidential election VEP turnout
pVEPtr <- VEPtr[pres]
names(pVEPtr) <- turnout$year[pres]
pVEPtr


# Midterm elections
mVEPtr <- VEPtr[mids]
names(mVEPtr) <- turnout$year[mids]
mVEPtr


# Sample average
# Presidential
mean(pVEPtr)

# Midterm
mean(mVEPtr)


# Difference 

mean(pVEPtr) - mean(mVEPtr)
