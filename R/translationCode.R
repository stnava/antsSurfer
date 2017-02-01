#' Read freesurfer files into a Matrix
#'
#' Read freesurfer files into rows of a matrix, given a valuetype i.e. something
#' stored in a freesurfer vertex or surface data file.
#'
#' @param freesurferFileNames a list of filenames pointing to freesurfer data
#' @return A matrix containing the freesurfer data.
#' @author Avants BB
#' @examples
#'
#' if ( freesurfer::have_fs( ) ) {
#'   fname = file.path( freesurfer::fs_subj_dir(), "bert", "surf", "lh.thickness")
#'   thfns = c( fname, fname )
#'   mat = freesurferToMatrix( thfns )
#'   }
#' \dontrun{
#' xs = scale( x , center = TRUE, scale = FALSE )
#' smat = sparseDistanceMatrix( xs, k = 10, kmetric = "covariance",
#'   eps = 1e-06, mypkg = "rflann")
#' mydecom = irlba::irlba( smat, nv = 5 )
#' myproj = x %*% mydecom$v
#' pheatmap::pheatmap( cor( myproj ) )
#' hist( abs( mydecom$v[,1] )[ abs( mydecom$v[,1] )>1.e-4] )
#' # same kind of thing with sparseDistanceMatrixXY
#' }
#'
#' @export freesurferToMatrix
freesurferToMatrix <- function( freesurferFileNames ) {
  n <- length( freesurferFileNames )
  if (n < 1) {
    print(" length of input list must be >= 1 ")
    return(NA)
  }
  temp = freesurfer::surf_convert( freesurferFileNames[ 1 ] )
  ncols = ncol( temp )
  nrows = nrow( temp )
  mat = matrix( nrow = n, ncol = nrows )
  for ( k in 1:length( freesurferFileNames ) ) {
    temp = freesurfer::surf_convert( freesurferFileNames[ k ] )
    if ( nrow( temp ) != nrows )
      stop( paste( "for entry", k, "nrow( temp ) != nrows" ) )
    mat[ k, ] = temp[ , ncols ]
  }
  return( mat )
}
