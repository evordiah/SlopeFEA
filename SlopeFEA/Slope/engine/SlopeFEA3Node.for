!***********************************************************************
! PROJECT:     SlopeFEA (c) 2011 Brandon Karchewski
!              Licensed under the Academic Free License version 3.0
!                  http://www.opensource.org/licenses/afl-3.0.php
! 
! CONTACT:     Brandon Karchewski
!              Department of Civil Engineering
!              McMaster University, JHE-301
!              1280 Main St W
!              Hamilton, Ontario, Canada
!              L8S 4L7
!              p: 905-525-9140 x24287
!              f: 905-529-9688
!              e: karcheba@mcmaster.ca
!              
! 
! SOURCE INFORMATION:
! 
! The repository for this software project is hosted on git at:
!      
!      git://github.com/karcheba/SlopeFEA
!      
! As such, the code for the project is free and open source.
! The relevant license is AFLv3 (see link above). See the
! README file in the root directory of the repository for a
! detailed project description, acknowledgements, references,
! and the revision history.
!***********************************************************************
!
!
      SUBROUTINE slopefea3node (fpath)
      USE gcontrol    ! controls inputs, grid, and elements
      USE feutility   ! utility functions for FEA solver
!
!$    USE OMP_LIB       ! parallel lib (gfortran: compile with -fopenmp switch)
!
      IMPLICIT NONE
!
      CHARACTER*(*), INTENT(IN) :: fpath    ! path to data files
!
      ANTYPE = 'PLANE STRAIN ELASTIC'
      CALL INPUT(fpath)     ! initialize data in gcontrol
!
!     set up load vectors (gravity and traction
      CALL LOAD(GLOAD, TLOAD)
!
!     form and decompose global stiffness matrix
      CALL STFMAT(GSTIF)
!
      CALL CLEANUP()
!
      RETURN
!
      END SUBROUTINE slopefea3node