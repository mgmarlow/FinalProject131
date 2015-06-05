# Credit to the UCI Machine Learning Repository for this data set
#
# set: 1985 Auto Imports Database
# Source Information:
# -- Creator/Donor: Jeffrey C. Schlimmer (Jeffrey.Schlimmer@a.gp.cs.cmu.edu)
# -- Date: 19 May 1987
# -- Sources:
#   1) 1985 Model Import Car and Truck Specifications, 1985 Ward's
#         Automotive Yearbook.
#   2) Personal Auto Manuals, Insurance Services Office, 160 Water
#         Street, New York, NY 10038 
#   3) Insurance Collision Report, Insurance Institute for Highway
#         Safety, Watergate 600, Washington, DC 20037
#


# Read data, assign variable names
auto.data <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/autos/imports-85.data",
                   header=F, sep=",")

colnames(auto.data) = c(
  'symboling',
  'normalized.losses',
  'make',
  'fuel.type',
  'aspiration',
  'num.doors',
  'body.style',
  'drive.wheels',
  'engine.location',
  'wheel.base',
  'length',
  'width',
  'height',
  'curb.weight',
  'engine.type',
  'num.of.cylinders',
  'engine.size',
  'fuel.system',
  'bore',
  'stroke',
  'compression.ratio',
  'horsepower',
  'peak.rpm',
  'city.mpg',
  'highway.mpg',
  'price'
  )