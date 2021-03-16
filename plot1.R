# Plot 1








with(faithful,plot(eruptions,waiting))
title(main="Old Faithful Geyser data")
dev.copy(png,file="geyserplot.png")
dev.off()




























