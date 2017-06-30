# minimal
Minimal examples for learning Shiny

## clientVsServer

This Shiny example illustrates the difference between loading a file from the client using `fileInput` and the server using shinyFiles.

## issueRenderUI

This Shiny example illustrates the issue with using shinyFiles within a `renderUI` call.  Appears to possibly a more general Shiny issue.

* Original ticket in shinyFiles repo:  https://github.com/thomasp85/shinyFiles/issues/25
* Possible more general related ticket in Shiny repo:  https://github.com/rstudio/shiny/issues/1244