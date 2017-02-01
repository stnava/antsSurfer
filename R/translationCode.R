#' Read freesurfer files into a Matrix
#'
#' Read freesurfer files into rows of a matrix, given a valuetype i.e. something
#' stored in a freesurfer vertex or surface file.
#'
#' @param freesurferFileNames
#' @param valuetype for example "thickness"
#' @return A matrix containing the freesurfer data.
#' @author Avants BB
#' @seealso \code{\link{imagesToMatrix}, \link{getMask}}
#' @examples
#'
#' # TODO
#'
#' @export freesurferToMatrix
freesurferToMatrix <- function( freesurferFileNames, valuetype='thickness' ) {
  n <- length( freesurferFileNames )
  if (n < 1) {
    print(" length of input list must be >= 1 ")
    return(NA)
  }
}
