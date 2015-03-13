!*******************************************************************************************************
!****u* JSON/jf_test_9
!
!  NAME
!    jf_test_9
!
!  DESCRIPTION
!    Ninth unit test.
!
!  AUTHOR
!    Jacob Williams : 3/2/3015
!
!  LICENSE
!
!    JSON-FORTRAN: A Fortran 2008 JSON API
!
!    https://github.com/jacobwilliams/json-fortran
!
!    Copyright (c) 2014, Jacob Williams
!
!    All rights reserved.
!
!    Redistribution and use in source and binary forms, with or without modification,
!    are permitted provided that the following conditions are met:
!    * Redistributions of source code must retain the above copyright notice, this
!      list of conditions and the following disclaimer.
!    * Redistributions in binary form must reproduce the above copyright notice, this
!      list of conditions and the following disclaimer in the documentation and/or
!      other materials provided with the distribution.
!    * The names of its contributors may not be used to endorse or promote products
!      derived from this software without specific prior written permission.
!    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
!    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
!    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
!    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
!    ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
!    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
!    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
!    ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
!    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
!    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
!
!  SOURCE

module jf_test_9_mod

    use json_module
    use, intrinsic :: iso_fortran_env , only: error_unit, output_unit, wp => real64

    implicit none
    !small file - 0.0 sec : http://www.json-generator.com
    !character(len=*),parameter :: filename = 'random1.json'

    !7 MB - 5.4 sec : http://www.json-generator.com
    character(len=*),parameter :: filename = 'big.json'

    !13 MB - 7.6 sec : http://mtgjson.com
    !character(len=*),parameter :: filename = 'AllSets.json'

    !100 MB - takes forever... : https://github.com/seductiveapps/largeJSON
    !character(len=*),parameter :: filename = '100mb.json'

    character(len=*),parameter :: dir = '../files/inputs/' !working directory

contains

    subroutine test_9(error_cnt)

!   Open a random JSON file generated by http://www.json-generator.com

    implicit none

    integer,intent(out) :: error_cnt

    type(json_file) :: f
    real :: tstart, tend

    error_cnt = 0
    call json_initialize()
    if (json_failed()) then
        call json_print_error_message(error_unit)
        error_cnt = error_cnt + 1
    end if

    write(error_unit,'(A)') ''
    write(error_unit,'(A)') '================================='
    write(error_unit,'(A)') '   EXAMPLE 9 '
    write(error_unit,'(A)') '================================='

    write(error_unit,'(A)') ''
    write(error_unit,'(A)') '  Load a file using json_file%load_file'
    write(error_unit,'(A)') ''
    write(error_unit,'(A)') 'Loading file: '//trim(filename)

    call cpu_time(tstart)
    call f%load_file(dir//filename)
    call cpu_time(tend)
    write(error_unit,'(A,1X,F10.3,1X,A)') 'Elapsed time: ',tend-tstart,' sec'

    if (json_failed()) then
        call json_print_error_message(error_unit)
        error_cnt = error_cnt + 1
    else
        write(error_unit,'(A)') 'File successfully read'
    end if
    write(error_unit,'(A)') ''

    !cleanup:
    call f%destroy()

    end subroutine test_9

end module jf_test_9_mod

program jf_test_9
    use jf_test_9_mod , only: test_9
    implicit none
    integer :: n_errors
    n_errors = 0
    call test_9(n_errors)
    if (n_errors /= 0) stop 1
end program jf_test_9

!*******************************************************************************************************
