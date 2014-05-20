!=========================================================================================
module finite_elem_mapping
    use global_parameters, only            : sp, dp, pi, deg2rad, rad2deg, verbose, lu_out

    implicit none
    private
contains

!-----------------------------------------------------------------------------------------
pure function mapping_subpar(xi, eta, nodes)
!< This routines computes the coordinates along the iaxis axis of the image of
!! any point in the reference domain in the physical domain.
!
! Topology is defined as follows 
!
! 4 - - - - - - - 3
! |       ^       |
! |   eta |       |
! |       |       |
! |        --->   |
! |        xi     |
! |               |
! |               |
! 1 - - - - - - - 2
  
  real(kind=dp), intent(in) :: xi, eta, nodes(4,2)
  real(kind=dp)             :: mapping_subpar(2)
  integer                   :: inode
  real(kind=dp)             :: shp(4)

  ! Compute the shape functions

  shp = shp4(xi, eta)
  
  mapping_subpar = 0

  do inode = 1, 4
     mapping_subpar(:) = mapping_subpar(:) + shp(inode) * nodes(inode, :)
  end do

end function mapping_subpar
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
pure function jacobian_subpar(xi, eta, nodes)

  real(kind=dp), intent(in)  :: xi, eta, nodes(4,2)
  real(kind=dp)              :: jacobian_subpar(2,2)
  integer                    :: inode
  real(kind=dp)              :: shpder(4,2)

  ! Compute the  derivatives of the shape functions
  shpder = shp4der(xi, eta)

  jacobian_subpar = 0

  do inode = 1, 4
     jacobian_subpar(1,1) = jacobian_subpar(1,1) &
                              + nodes(inode,1) * shpder(inode,1)
     jacobian_subpar(1,2) = jacobian_subpar(1,2) &
                              + nodes(inode,1) * shpder(inode,2)
     jacobian_subpar(2,1) = jacobian_subpar(2,1) &
                              + nodes(inode,2) * shpder(inode,1)
     jacobian_subpar(2,2) = jacobian_subpar(2,2) &
                              + nodes(inode,2) * shpder(inode,2)
  end do

end function jacobian_subpar
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
pure function inv_jacobian_subpar(xi, eta, nodes)

  real(kind=dp), intent(in)  :: xi, eta, nodes(4,2)
  real(kind=dp)              :: inv_jacobian_subpar(2,2)
  real(kind=dp)              :: jacobian(2,2), jacobian_det

  jacobian = jacobian_subpar(xi, eta, nodes)
  jacobian_det = jacobian(1,1) * jacobian(2,2) - jacobian(2,1) * jacobian(1,2)

  inv_jacobian_subpar(1,1) =   jacobian(2,2) / jacobian_det
  inv_jacobian_subpar(2,1) = - jacobian(2,1) / jacobian_det
  inv_jacobian_subpar(1,2) = - jacobian(1,2) / jacobian_det
  inv_jacobian_subpar(2,2) =   jacobian(1,1) / jacobian_det

end function inv_jacobian_subpar
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
pure function shp4(xi, eta)
!< This routine computes and returns the linear
!! shape functions axixiociated with a 4-nodes
!! element for a given point of coordinates (xi,eta).
!
  real(kind=dp), intent(in)  :: xi, eta
  real(kind=dp)              :: shp4(4)
  real(kind=dp)              :: xip, xim, etap, etam

  xip  = 1 +  xi
  xim  = 1 -  xi 
  etap = 1 + eta
  etam = 1 - eta

  shp4(1) = xim * etam / 4
  shp4(2) = xip * etam / 4
  shp4(3) = xip * etap / 4
  shp4(4) = xim * etap / 4

end function shp4
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
pure function shp4der(xi, eta)
!< This routine computes and returns the derivatives
!! of the shape functions axixiociated with a 4-nodes
!! element for a given point of coordinates (xi,eta).

  real(kind=dp), intent(in)  :: xi, eta
  real(kind=dp)              :: shp4der(4,2)
  real(kind=dp)              :: xip, xim, etap, etam
 
  xip  = 1 +  xi
  xim  = 1 -  xi 
  etap = 1 + eta
  etam = 1 - eta
 
  ! derivatives with respect to xi
  shp4der(1,1) = - etam / 4
  shp4der(2,1) =   etam / 4
  shp4der(3,1) =   etap / 4
  shp4der(4,1) = - etap / 4

  ! derivatives with respect to eta
  shp4der(1,2) = - xim / 4
  shp4der(2,2) = - xip / 4
  shp4der(3,2) =   xip / 4
  shp4der(4,2) =   xim / 4

end function shp4der
!-----------------------------------------------------------------------------------------


end module
!=========================================================================================
