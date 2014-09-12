PROG = kerner

SRCS =	commpi.F90 buffer.f90 calc_kernels.f90 clocks.f90 fft_type.f90 \
	filtering.f90 finite_elem_mapping.f90 ftnunit.f90 \
	global_parameters.f90 halton.f90 inv_mesh.f90 kdtree2.f90 kernel.f90 \
	master_mod.f90 master_queue.f90 master_slave_parameters.f90 \
	mc_integration.f90 nc_routines.f90 plot_wavefields.f90 \
	random_tetrahedron.f90 random_voxel.f90 readfields.f90 receiver.f90 \
	rotations.f90 sem_derivatives.f90 simple_routines.f90 slave.f90 \
	source.f90 spectral_basis.f90 test_buffer.f90 test_fft_type.f90 \
	test_filter.f90 test_finite_elem_mapping.f90 test_ftnunit.f90 \
	test_halton.f90 test_inv_mesh.f90 test_kernel.f90 test_mc.f90 \
	test_readfields.f90 test_rotations.f90 test_sem_derivatives.f90 \
	test_simple_routines.f90 test_source.f90 test_spectral_basis.f90 \
	test_tetrahedra.f90 test_voxel.f90 type_parameter.f90 worktype.f90

OBJS =	commpi.o buffer.o calc_kernels.o clocks.o fft_type.o filtering.o \
	finite_elem_mapping.o ftnunit.o global_parameters.o halton.o \
	inv_mesh.o kdtree2.o kernel.o master_mod.o master_queue.o \
	master_slave_parameters.o mc_integration.o nc_routines.o \
	plot_wavefields.o random_tetrahedron.o random_voxel.o readfields.o \
	receiver.o rotations.o sem_derivatives.o simple_routines.o slave.o \
	source.o spectral_basis.o test_buffer.o test_fft_type.o test_filter.o \
	test_finite_elem_mapping.o test_ftnunit.o test_halton.o \
	test_inv_mesh.o test_kernel.o test_mc.o test_readfields.o \
	test_rotations.o test_sem_derivatives.o test_simple_routines.o \
	test_source.o test_spectral_basis.o test_tetrahedra.o test_voxel.o \
	type_parameter.o worktype.o

#Example to include specific netcdf libraries: 
LIBS = -lm -llapack -lfftw3 -lfftw3f -lnetcdff 

# set unc to compile with netcdf: 
F90FLAGS = -cpp 
CC = gcc
CFLAGS = -O3 -DF_UNDERSCORE
F90 = mpif90 -O3  -fbacktrace -g 
 
# to include local built of netcdf you might want to use sth like this: 
INCLUDE = -I /usr/include 


# cancel m2c implicit rule 
%.o : %.mod 
 

all: $(PROG)

$(PROG): $(OBJS)
	$(F90) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

clean:
	rm -f $(PROG) $(OBJS) *.M *.mod *.d *.il core 

.SUFFIXES: $(SUFFIXES) .f90 .F90

.f90.o:
	$(F90) $(F90FLAGS) -c $(INCLUDE) $<

.F90.o:
	$(F90) $(F90FLAGS) -c $(INCLUDE) $<

buffer.o: commpi.o global_parameters.o Makefile 
calc_kernels.o: clocks.o commpi.o ftnunit.o global_parameters.o inv_mesh.o \
	master_mod.o plot_wavefields.o simple_routines.o slave.o \
	test_ftnunit.o type_parameter.o worktype.o Makefile 
clocks.o: global_parameters.o Makefile 
fft_type.o: commpi.o global_parameters.o simple_routines.o  Makefile 
filtering.o: commpi.o fft_type.o global_parameters.o simple_routines.o Makefile 
finite_elem_mapping.o: global_parameters.o Makefile 
ftnunit.o:  Makefile 
global_parameters.o:  Makefile 
halton.o: global_parameters.o Makefile 
inv_mesh.o: commpi.o global_parameters.o random_tetrahedron.o random_voxel.o Makefile 
kdtree2.o: kdtree2.o Makefile 
kernel.o: commpi.o fft_type.o filtering.o global_parameters.o Makefile 
master_mod.o: master_queue.o master_slave_parameters.o worktype.o Makefile 
master_queue.o: global_parameters.o inv_mesh.o simple_routines.o \
	type_parameter.o worktype.o Makefile 
master_slave_parameters.o:  Makefile 
mc_integration.o: commpi.o global_parameters.o Makefile 
nc_routines.o: commpi.o global_parameters.o Makefile 
plot_wavefields.o: fft_type.o filtering.o global_parameters.o inv_mesh.o \
	readfields.o type_parameter.o Makefile 
random_tetrahedron.o: global_parameters.o halton.o simple_routines.o Makefile 
random_voxel.o: global_parameters.o Makefile 
readfields.o: buffer.o clocks.o commpi.o finite_elem_mapping.o \
	global_parameters.o kdtree2.o nc_routines.o receiver.o rotations.o \
	sem_derivatives.o source.o spectral_basis.o Makefile 
receiver.o: global_parameters.o kernel.o Makefile 
rotations.o: commpi.o global_parameters.o Makefile 
sem_derivatives.o: commpi.o finite_elem_mapping.o global_parameters.o Makefile 
simple_routines.o: global_parameters.o Makefile 
slave.o: clocks.o fft_type.o filtering.o global_parameters.o inv_mesh.o \
	mc_integration.o readfields.o type_parameter.o worktype.o Makefile 
source.o: commpi.o fft_type.o global_parameters.o Makefile 
spectral_basis.o: global_parameters.o Makefile 
test_buffer.o: buffer.o ftnunit.o global_parameters.o Makefile 
test_fft_type.o: fft_type.o ftnunit.o global_parameters.o Makefile 
test_filter.o: fft_type.o filtering.o ftnunit.o global_parameters.o Makefile 
test_finite_elem_mapping.o: finite_elem_mapping.o ftnunit.o \
	global_parameters.o Makefile 
test_ftnunit.o: ftnunit.o global_parameters.o test_buffer.o test_fft_type.o \
	test_filter.o test_finite_elem_mapping.o test_halton.o \
	test_inv_mesh.o test_kernel.o test_mc.o test_readfields.o \
	test_rotations.o test_sem_derivatives.o test_simple_routines.o \
	test_source.o test_spectral_basis.o test_tetrahedra.o test_voxel.o Makefile 
test_halton.o: ftnunit.o global_parameters.o halton.o Makefile 
test_inv_mesh.o: ftnunit.o global_parameters.o inv_mesh.o \
	random_tetrahedron.o Makefile 
test_kernel.o: ftnunit.o global_parameters.o kernel.o Makefile 
test_mc.o: ftnunit.o global_parameters.o mc_integration.o \
	random_tetrahedron.o Makefile 
test_readfields.o: ftnunit.o global_parameters.o readfields.o \
	type_parameter.o Makefile 
test_rotations.o: ftnunit.o global_parameters.o rotations.o Makefile 
test_sem_derivatives.o: finite_elem_mapping.o ftnunit.o global_parameters.o \
	sem_derivatives.o spectral_basis.o Makefile 
test_simple_routines.o: ftnunit.o global_parameters.o simple_routines.o Makefile 
test_source.o: ftnunit.o global_parameters.o source.o Makefile 
test_spectral_basis.o: ftnunit.o global_parameters.o spectral_basis.o Makefile 
test_tetrahedra.o: ftnunit.o global_parameters.o halton.o inv_mesh.o \
	random_tetrahedron.o simple_routines.o Makefile 
test_voxel.o: ftnunit.o global_parameters.o inv_mesh.o random_voxel.o Makefile 
type_parameter.o: commpi.o filtering.o global_parameters.o kernel.o \
	readfields.o receiver.o simple_routines.o source.o Makefile 
worktype.o: global_parameters.o Makefile 
commpi.F90: global_parameters.o Makefile 
