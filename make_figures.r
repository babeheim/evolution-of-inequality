
# extract path data directly from Petit, et al. (1999) Figure 3

x <- readLines("pathdata.txt")

# the comma means the division between the x and y coordinate
# the space separates coordinate pairs
x <- gsub("m ", "", x) # make sure it starts w/ leading x coordinate from left to right
x <- gsub(" ", "\n", x)
writeLines(x, "raw.csv")

d <- read.csv("raw.csv", header = FALSE)

d[, 2] <- d[, 2] * (-1)

for(i in 2:nrow(d)){
  d[i, 1] <- d[i - 1, 1] + d[i, 1]
  d[i, 2] <- d[i - 1, 2] + d[i, 2]
}

colnames(d) <- c("x", "y")

o <- order(d$x)
d <- d[o, ]

plot(d$x, d$y, log="x")

d$x <- d$x - min(d$x) + 1

# rescale using approximated anchor points
d$year <- (1:nrow(d) - 1) * 10000 / 122.25  # not perfect but whatever
d$temp.diff <- (d$y + 498.707) * 2 / (14.7)

d <- d[,c("year", "temp.diff")]

write.csv(d, "petit_1999_temp.csv", row.names=FALSE)

# plot figure 1

d <- read.csv("./petit_1999_temp.csv", stringsAsFactors = FALSE)

png("petit-1999-climate-stability.png", height = 5, width = 7,
  units = "in", res = 300)
plot(d$year, d$temp.diff, log="x", col="gray", xlim = c(1e5, 1e2),
xlab = "years before present", ylab = "temperature change (°
C)", las = 1)
points(lowess(d$temp.diff ~ d$year, f=0.01), type="l")
dev.off()
