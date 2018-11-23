#CONVERT BACKSLASH FILE PATH TO FORWARD SLASH IN R
#R Code : Converting backslash file path to forward slash 
FSlash<- function(path = "clipboard") {
  y <- if (path == "clipboard") {
    readClipboard()
  } else {
    cat("Please enter the path:\n\n")
    readline()
  }
  x <- chartr("\\", "/", y)
  writeClipboard(x)
  return(x)
}


