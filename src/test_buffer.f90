!******************************************************************************
!
!    This file is part of:
!    MC Kernel: Calculating seismic sensitivity kernels on unstructured meshes
!    Copyright (C) 2016 Simon Staehler, Martin van Driel, Ludwig Auer
!
!    You can find the latest version of the software at:
!    <https://www.github.com/tomography/mckernel>
!
!    MC Kernel is free software: you can redistribute it and/or modify
!    it under the terms of the GNU General Public License as published by
!    the Free Software Foundation, either version 3 of the License, or
!    (at your option) any later version.
!
!    MC Kernel is distributed in the hope that it will be useful,
!    but WITHOUT ANY WARRANTY; without even the implied warranty of
!    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!    GNU General Public License for more details.
!
!    You should have received a copy of the GNU General Public License
!    along with MC Kernel. If not, see <http://www.gnu.org/licenses/>.
!
!******************************************************************************

!=========================================================================================
module test_buffer

  use global_parameters
  use buffer
  use ftnunit
  implicit none
  public
contains

!-----------------------------------------------------------------------------------------
subroutine test_buffer_storage_1d_sp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer = 1000
   real(kind=sp), dimension(lenbuffer) :: stufftostore
   integer                             :: iwrite, status

   status = buffer%init(nbuffer, 'real', lenbuffer)
   call assert_equal(status, 0, 'Buffer initialisation succeeds')

   do iwrite = 1, nbuffer + 1
      call random_number(stufftostore)
      status = buffer%put(iwrite, stufftostore)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%freeme()
   call assert_equal(status, 0, 'Buffer freeme succeeds')

end subroutine test_buffer_storage_1d_sp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_storage_2d_sp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer1 = 1000, lenbuffer2 = 2
   real(kind=sp)                       :: stufftostore(lenbuffer1, lenbuffer2)
   integer                             :: iwrite, status

   status = buffer%init(nbuffer, 'real', lenbuffer1, lenbuffer2)
   call assert_equal(status, 0, 'Buffer initialisation succeeds')

   do iwrite = 1, nbuffer + 1
      call random_number(stufftostore)
      status = buffer%put(iwrite, stufftostore)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%freeme()
   call assert_equal(status, 0, 'Buffer freeme succeeds')

end subroutine test_buffer_storage_2d_sp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_storage_3d_sp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer1 = 1000, lenbuffer2 = 2, &
                                          lenbuffer3 = 2
   real(kind=sp)                       :: stufftostore(lenbuffer1, lenbuffer2, lenbuffer3)
   integer                             :: iwrite, status

   status = buffer%init(nbuffer, 'real', lenbuffer1, lenbuffer2, lenbuffer3)
   call assert_equal(status, 0, 'Buffer initialisation succeeds')

   do iwrite = 1, nbuffer + 1
      call random_number(stufftostore)
      status = buffer%put(iwrite, stufftostore)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%freeme()
   call assert_equal(status, 0, 'Buffer freeme succeeds')

end subroutine test_buffer_storage_3d_sp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_storage_4d_sp
   type(buffer_type)    :: buffer
   integer, parameter   :: nbuffer = 100
   integer, parameter   :: lenbuffer1 = 1000, lenbuffer2 = 2, &
                           lenbuffer3 = 2, lenbuffer4 = 2
   real(kind=sp)        :: stufftostore(lenbuffer1, lenbuffer2, lenbuffer3, lenbuffer4)
   integer              :: iwrite, status

   status = buffer%init(nbuffer, 'real', lenbuffer1, lenbuffer2, lenbuffer3, lenbuffer4)
   call assert_equal(status, 0, 'Buffer initialisation succeeds')

   do iwrite = 1, nbuffer + 1
      call random_number(stufftostore)
      status = buffer%put(iwrite, stufftostore)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%freeme()
   call assert_equal(status, 0, 'Buffer freeme succeeds')

end subroutine test_buffer_storage_4d_sp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_storage_5d_sp
   type(buffer_type)    :: buffer
   integer, parameter   :: nbuffer = 100
   integer, parameter   :: lenbuffer1 = 1000, lenbuffer2 = 2, &
                           lenbuffer3 = 2, lenbuffer4 = 2, lenbuffer5 = 2
   real(kind=sp)        :: stufftostore(lenbuffer1, lenbuffer2, lenbuffer3, &
                                        lenbuffer4, lenbuffer5)
   integer              :: iwrite, status

   status = buffer%init(nbuffer, 'real', lenbuffer1, lenbuffer2, &
                        lenbuffer3, lenbuffer4, lenbuffer5)
   call assert_equal(status, 0, 'Buffer initialisation succeeds')

   do iwrite = 1, nbuffer + 1
      call random_number(stufftostore)
      status = buffer%put(iwrite, stufftostore)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%freeme()
   call assert_equal(status, 0, 'Buffer freeme succeeds')

end subroutine test_buffer_storage_5d_sp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_storage_1d_dp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer = 1000
   real(kind=dp), dimension(lenbuffer) :: stufftostore
   integer                             :: iwrite, status

   status = buffer%init(nbuffer, 'dble', lenbuffer)
   call assert_equal(status, 0, 'Buffer initialisation succeeds')

   do iwrite = 1, nbuffer + 1
      call random_number(stufftostore)
      status = buffer%put(iwrite, stufftostore)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%freeme()
   call assert_equal(status, 0, 'Buffer freeme succeeds')

end subroutine test_buffer_storage_1d_dp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_storage_2d_dp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer1 = 1000, lenbuffer2 = 2
   real(kind=dp)                       :: stufftostore(lenbuffer1, lenbuffer2)
   integer                             :: iwrite, status

   status = buffer%init(nbuffer, 'dble', lenbuffer1, lenbuffer2)
   call assert_equal(status, 0, 'Buffer initialisation succeeds')

   do iwrite = 1, nbuffer + 1
      call random_number(stufftostore)
      status = buffer%put(iwrite, stufftostore)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%freeme()
   call assert_equal(status, 0, 'Buffer freeme succeeds')

end subroutine test_buffer_storage_2d_dp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_storage_3d_dp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer1 = 1000, lenbuffer2 = 2, &
                                          lenbuffer3 = 2
   real(kind=dp)                       :: stufftostore(lenbuffer1, lenbuffer2, lenbuffer3)
   integer                             :: iwrite, status

   status = buffer%init(nbuffer, 'dble', lenbuffer1, lenbuffer2, lenbuffer3)
   call assert_equal(status, 0, 'Buffer initialisation succeeds')

   do iwrite = 1, nbuffer + 1
      call random_number(stufftostore)
      status = buffer%put(iwrite, stufftostore)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%freeme()
   call assert_equal(status, 0, 'Buffer freeme succeeds')

end subroutine test_buffer_storage_3d_dp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_storage_4d_dp
   type(buffer_type)    :: buffer
   integer, parameter   :: nbuffer = 100
   integer, parameter   :: lenbuffer1 = 1000, lenbuffer2 = 2, &
                           lenbuffer3 = 2, lenbuffer4 = 2
   real(kind=dp)        :: stufftostore(lenbuffer1, lenbuffer2, lenbuffer3, lenbuffer4)
   integer              :: iwrite, status

   status = buffer%init(nbuffer, 'dble', lenbuffer1, lenbuffer2, lenbuffer3, lenbuffer4)
   call assert_equal(status, 0, 'Buffer initialisation succeeds')

   do iwrite = 1, nbuffer + 1
      call random_number(stufftostore)
      status = buffer%put(iwrite, stufftostore)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%freeme()
   call assert_equal(status, 0, 'Buffer freeme succeeds')

end subroutine test_buffer_storage_4d_dp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_storage_5d_dp
   type(buffer_type)    :: buffer
   integer, parameter   :: nbuffer = 100
   integer, parameter   :: lenbuffer1 = 1000, lenbuffer2 = 2, &
                           lenbuffer3 = 2, lenbuffer4 = 2, lenbuffer5 = 2
   real(kind=dp)        :: stufftostore(lenbuffer1, lenbuffer2, lenbuffer3, &
                                        lenbuffer4, lenbuffer5)
   integer              :: iwrite, status

   status = buffer%init(nbuffer, 'dble', lenbuffer1, lenbuffer2, &
                        lenbuffer3, lenbuffer4, lenbuffer5)
   call assert_equal(status, 0, 'Buffer initialisation succeeds')

   do iwrite = 1, nbuffer + 1
      call random_number(stufftostore)
      status = buffer%put(iwrite, stufftostore)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%freeme()
   call assert_equal(status, 0, 'Buffer freeme succeeds')

end subroutine test_buffer_storage_5d_dp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_retrieval_1d_sp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer = 1000
   real(kind=sp), dimension(lenbuffer) :: stufftostore, stuffretrieved
   integer                             :: iwrite, status

   status = buffer%init(nbuffer, 'real', lenbuffer)

   stuffretrieved = 0.0
   call random_number(stufftostore)

   ! After ten other writes to the buffer, the data should still be there
   status = buffer%put(1, stufftostore)
   call assert_equal(status, 0, 'Buffer put succeeds')
   do iwrite = 2, nbuffer/10
      status = buffer%put(iwrite, stufftostore*iwrite)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do
   status = buffer%get(1, stuffretrieved)
   call assert_equal(status, 0, 'Buffer get succeeds')
   call assert_comparable_real1d(stufftostore, stuffretrieved, &
                                 1e-7, 'Buffer gives correct data back')
   status = buffer%freeme()

end subroutine test_buffer_retrieval_1d_sp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_retrieval_2d_sp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer1 = 1000, lenbuffer2 = 2
   real(kind=sp)                       :: stufftostore(lenbuffer1, lenbuffer2), &
                                          stuffretrieved(lenbuffer1, lenbuffer2)
   integer                             :: iwrite, status, ibuff

   status = buffer%init(nbuffer, 'real', lenbuffer1, lenbuffer2)

   stuffretrieved = 0.0
   call random_number(stufftostore)

   ! After ten other writes to the buffer, the data should still be there
   status = buffer%put(1, stufftostore)
   call assert_equal(status, 0, 'Buffer put succeeds')

   do iwrite = 2, nbuffer/10
      status = buffer%put(iwrite, stufftostore*iwrite)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%get(1, stuffretrieved)
   call assert_equal(status, 0, 'Buffer get succeeds')
   do ibuff = 1, lenbuffer2
      call assert_comparable_real1d(stufftostore(:,ibuff), stuffretrieved(:,ibuff), &
                                    1e-7, 'Buffer gives correct data back')
   enddo

   status = buffer%freeme()

end subroutine test_buffer_retrieval_2d_sp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_retrieval_3d_sp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer1 = 1000, lenbuffer2 = 2, &
                                          lenbuffer3 = 2
   real(kind=sp)                       :: stufftostore(lenbuffer1, lenbuffer2, lenbuffer3), &
                                          stuffretrieved(lenbuffer1, lenbuffer2, lenbuffer3)
   integer                             :: iwrite, status, ibuff, jbuff

   status = buffer%init(nbuffer, 'real', lenbuffer1, lenbuffer2, lenbuffer3)

   stuffretrieved = 0.0
   call random_number(stufftostore)

   ! After ten other writes to the buffer, the data should still be there
   status = buffer%put(1, stufftostore)
   call assert_equal(status, 0, 'Buffer put succeeds')

   do iwrite = 2, nbuffer/10
      status = buffer%put(iwrite, stufftostore*iwrite)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%get(1, stuffretrieved)
   call assert_equal(status, 0, 'Buffer get succeeds')
   do ibuff = 1, lenbuffer2
      do jbuff = 1, lenbuffer3
         call assert_comparable_real1d(stufftostore(:,ibuff, jbuff), stuffretrieved(:,ibuff, jbuff), &
                                       1e-7, 'Buffer gives correct data back')
      enddo
   enddo

   status = buffer%freeme()

end subroutine test_buffer_retrieval_3d_sp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_retrieval_4d_sp
   type(buffer_type)    :: buffer
   integer, parameter   :: nbuffer = 100
   integer, parameter   :: lenbuffer1 = 1000, lenbuffer2 = 2, &
                           lenbuffer3 = 2, lenbuffer4 = 2
   real(kind=sp)        :: stufftostore(lenbuffer1, lenbuffer2, lenbuffer3, lenbuffer4), &
                           stuffretrieved(lenbuffer1, lenbuffer2, lenbuffer3, lenbuffer4)
   integer              :: iwrite, status, ibuff, jbuff, kbuff

   status = buffer%init(nbuffer, 'real', lenbuffer1, lenbuffer2, lenbuffer3, lenbuffer4)

   stuffretrieved = 0.0
   call random_number(stufftostore)

   ! After ten other writes to the buffer, the data should still be there
   status = buffer%put(1, stufftostore)
   call assert_equal(status, 0, 'Buffer put succeeds')

   do iwrite = 2, nbuffer/10
      status = buffer%put(iwrite, stufftostore*iwrite)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%get(1, stuffretrieved)
   call assert_equal(status, 0, 'Buffer get succeeds')
   do ibuff = 1, lenbuffer2
      do jbuff = 1, lenbuffer3
         do kbuff = 1, lenbuffer4
            call assert_comparable_real1d(stufftostore(:,ibuff,jbuff,kbuff), &
                                          stuffretrieved(:,ibuff,jbuff,kbuff), &
                                          1e-7, 'Buffer gives correct data back')
         enddo
      enddo
   enddo

   status = buffer%freeme()

end subroutine test_buffer_retrieval_4d_sp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_retrieval_5d_sp
   type(buffer_type)    :: buffer
   integer, parameter   :: nbuffer = 100
   integer, parameter   :: lenbuffer1 = 1000, lenbuffer2 = 2, &
                           lenbuffer3 = 2, lenbuffer4 = 2, lenbuffer5 = 2
   real(kind=sp)        :: stufftostore(lenbuffer1, lenbuffer2, &
                                        lenbuffer3, lenbuffer4, &
                                        lenbuffer5)
   real(kind=sp)        :: stuffretrieved(lenbuffer1, lenbuffer2, &
                                          lenbuffer3, lenbuffer4, &
                                          lenbuffer5)
   integer              :: iwrite, status, ibuff, jbuff, kbuff, lbuff

   status = buffer%init(nbuffer, 'real', lenbuffer1, lenbuffer2, &
                        lenbuffer3, lenbuffer4, lenbuffer5)

   stuffretrieved = 0.0
   call random_number(stufftostore)

   ! After ten other writes to the buffer, the data should still be there
   status = buffer%put(1, stufftostore)
   call assert_equal(status, 0, 'Buffer put succeeds')

   do iwrite = 2, nbuffer/10
      status = buffer%put(iwrite, stufftostore*iwrite)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%get(1, stuffretrieved)
   call assert_equal(status, 0, 'Buffer get succeeds')
   do ibuff = 1, lenbuffer2
     do jbuff = 1, lenbuffer3
        do kbuff = 1, lenbuffer4
          do lbuff = 1, lenbuffer4
            call assert_comparable_real1d(stufftostore(:,ibuff,jbuff,kbuff,lbuff), &
                                          stuffretrieved(:,ibuff,jbuff,kbuff,lbuff), &
                                          1e-7, 'Buffer gives correct data back')
          enddo
        enddo
     enddo
   enddo

   status = buffer%freeme()

end subroutine test_buffer_retrieval_5d_sp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_retrieval_1d_dp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer = 1000
   real(kind=dp), dimension(lenbuffer) :: stufftostore, stuffretrieved
   integer                             :: iwrite, status

   status = buffer%init(nbuffer, 'dble', lenbuffer)

   stuffretrieved = 0.0
   call random_number(stufftostore)

   ! After ten other writes to the buffer, the data should still be there
   status = buffer%put(1, stufftostore)
   call assert_equal(status, 0, 'Buffer put succeeds')
   do iwrite = 2, nbuffer/10
      status = buffer%put(iwrite, stufftostore*iwrite)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do
   status = buffer%get(1, stuffretrieved)
   call assert_equal(status, 0, 'Buffer get succeeds')
   call assert_comparable(stufftostore, stuffretrieved, &
                          1d-7, 'Buffer gives correct data back')
   status = buffer%freeme()

end subroutine test_buffer_retrieval_1d_dp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_retrieval_2d_dp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer1 = 1000, lenbuffer2 = 2
   real(kind=dp)                       :: stufftostore(lenbuffer1, lenbuffer2), &
                                          stuffretrieved(lenbuffer1, lenbuffer2)
   integer                             :: iwrite, status, ibuff

   status = buffer%init(nbuffer, 'dble', lenbuffer1, lenbuffer2)

   stuffretrieved = 0.0
   call random_number(stufftostore)

   ! After ten other writes to the buffer, the data should still be there
   status = buffer%put(1, stufftostore)
   call assert_equal(status, 0, 'Buffer put succeeds')

   do iwrite = 2, nbuffer/10
      status = buffer%put(iwrite, stufftostore*iwrite)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%get(1, stuffretrieved)
   call assert_equal(status, 0, 'Buffer get succeeds')
   do ibuff = 1, lenbuffer2
      call assert_comparable(stufftostore(:,ibuff), stuffretrieved(:,ibuff), &
                             1d-7, 'Buffer gives correct data back')
   enddo

   status = buffer%freeme()

end subroutine test_buffer_retrieval_2d_dp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_retrieval_3d_dp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer1 = 1000, lenbuffer2 = 2, &
                                          lenbuffer3 = 2
   real(kind=dp)                       :: stufftostore(lenbuffer1, lenbuffer2, lenbuffer3), &
                                          stuffretrieved(lenbuffer1, lenbuffer2, lenbuffer3)
   integer                             :: iwrite, status, ibuff, jbuff

   status = buffer%init(nbuffer, 'dble', lenbuffer1, lenbuffer2, lenbuffer3)

   stuffretrieved = 0.0
   call random_number(stufftostore)

   ! After ten other writes to the buffer, the data should still be there
   status = buffer%put(1, stufftostore)
   call assert_equal(status, 0, 'Buffer put succeeds')

   do iwrite = 2, nbuffer/10
      status = buffer%put(iwrite, stufftostore*iwrite)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%get(1, stuffretrieved)
   call assert_equal(status, 0, 'Buffer get succeeds')
   do ibuff = 1, lenbuffer2
      do jbuff = 1, lenbuffer3
         call assert_comparable(stufftostore(:,ibuff, jbuff), stuffretrieved(:,ibuff, jbuff), &
                                1d-7, 'Buffer gives correct data back')
      enddo
   enddo

   status = buffer%freeme()

end subroutine test_buffer_retrieval_3d_dp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_retrieval_4d_dp
   type(buffer_type)    :: buffer
   integer, parameter   :: nbuffer = 100
   integer, parameter   :: lenbuffer1 = 1000, lenbuffer2 = 2, &
                           lenbuffer3 = 2, lenbuffer4 = 2
   real(kind=dp)        :: stufftostore(lenbuffer1, lenbuffer2, lenbuffer3, lenbuffer4), &
                           stuffretrieved(lenbuffer1, lenbuffer2, lenbuffer3, lenbuffer4)
   integer              :: iwrite, status, ibuff, jbuff, kbuff

   status = buffer%init(nbuffer, 'dble', lenbuffer1, lenbuffer2, lenbuffer3, lenbuffer4)

   stuffretrieved = 0.0
   call random_number(stufftostore)

   ! After ten other writes to the buffer, the data should still be there
   status = buffer%put(1, stufftostore)
   call assert_equal(status, 0, 'Buffer put succeeds')

   do iwrite = 2, nbuffer/10
      status = buffer%put(iwrite, stufftostore*iwrite)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%get(1, stuffretrieved)
   call assert_equal(status, 0, 'Buffer get succeeds')
   do ibuff = 1, lenbuffer2
      do jbuff = 1, lenbuffer3
         do kbuff = 1, lenbuffer4
            call assert_comparable(stufftostore(:,ibuff,jbuff,kbuff), &
                                   stuffretrieved(:,ibuff,jbuff,kbuff), &
                                   1d-7, 'Buffer gives correct data back')
         enddo
      enddo
   enddo

   status = buffer%freeme()

end subroutine test_buffer_retrieval_4d_dp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_retrieval_5d_dp
   type(buffer_type)    :: buffer
   integer, parameter   :: nbuffer = 100
   integer, parameter   :: lenbuffer1 = 1000, lenbuffer2 = 2, &
                           lenbuffer3 = 2, lenbuffer4 = 2, lenbuffer5 = 2
   real(kind=dp)        :: stufftostore(lenbuffer1, lenbuffer2, &
                                        lenbuffer3, lenbuffer4, &
                                        lenbuffer5)
   real(kind=dp)        :: stuffretrieved(lenbuffer1, lenbuffer2, &
                                          lenbuffer3, lenbuffer4, &
                                          lenbuffer5)
   integer              :: iwrite, status, ibuff, jbuff, kbuff, lbuff

   status = buffer%init(nbuffer, 'dble', lenbuffer1, lenbuffer2, &
                        lenbuffer3, lenbuffer4, lenbuffer5)

   stuffretrieved = 0.0
   call random_number(stufftostore)

   ! After ten other writes to the buffer, the data should still be there
   status = buffer%put(1, stufftostore)
   call assert_equal(status, 0, 'Buffer put succeeds')

   do iwrite = 2, nbuffer/10
      status = buffer%put(iwrite, stufftostore*iwrite)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do

   status = buffer%get(1, stuffretrieved)
   call assert_equal(status, 0, 'Buffer get succeeds')
   do ibuff = 1, lenbuffer2
     do jbuff = 1, lenbuffer3
        do kbuff = 1, lenbuffer4
          do lbuff = 1, lenbuffer4
            call assert_comparable(stufftostore(:,ibuff,jbuff,kbuff,lbuff), &
                                   stuffretrieved(:,ibuff,jbuff,kbuff,lbuff), &
                                   1d-7, 'Buffer gives correct data back')
          enddo
        enddo
     enddo
   enddo

   status = buffer%freeme()

end subroutine test_buffer_retrieval_5d_dp
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_overwrite_sp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer = 1000
   real(kind=sp), dimension(lenbuffer) :: stufftostore, stuffretrieved
   integer                             :: iwrite, status

   status = buffer%init(nbuffer, 'real', lenbuffer)

   stuffretrieved = 0.0
   call random_number(stufftostore)
  
   ! After 1000 other writes to the buffer, the data should be overwritten
   stuffretrieved = 0.0
   status = buffer%put(1, stufftostore)
   call assert_equal(status, 0, 'Buffer put succeeds')
   do iwrite = 2, nbuffer*10
      status = buffer%put(iwrite, stufftostore*iwrite)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do
   
   status = buffer%get(1, stuffretrieved)
   call assert_equal(status, -1, 'Buffer overwritten after reasonable time')

   status = buffer%freeme()

end subroutine
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine test_buffer_overwrite_dp
   type(buffer_type)                   :: buffer
   integer, parameter                  :: nbuffer = 100
   integer, parameter                  :: lenbuffer = 1000
   real(kind=dp), dimension(lenbuffer) :: stufftostore, stuffretrieved
   integer                             :: iwrite, status

   status = buffer%init(nbuffer, 'dble', lenbuffer)

   stuffretrieved = 0.0
   call random_number(stufftostore)
  
   ! After 1000 other writes to the buffer, the data should be overwritten
   stuffretrieved = 0.0
   status = buffer%put(1, stufftostore)
   call assert_equal(status, 0, 'Buffer put succeeds')
   do iwrite = 2, nbuffer*10
      status = buffer%put(iwrite, stufftostore*iwrite)
      call assert_equal(status, 0, 'Buffer put succeeds')
   end do
   
   status = buffer%get(1, stuffretrieved)
   call assert_equal(status, -1, 'Buffer overwritten after reasonable time')

   status = buffer%freeme()

end subroutine
!-----------------------------------------------------------------------------------------

end module
!=========================================================================================
