set(OpenMS_sources  CACHE INTERNAL "This variable should hold all OpenMS sources at the end of the config step" )

## ATTENTION: The order of includes should be similar to the inclusion hierarchy
include(source/INTERFACES_IMPL/sources.cmake)
include(source/CONCEPT/sources.cmake)
include(source/SYSTEM/sources.cmake)
include(source/MATH/STATISTICS/sources.cmake)
include(source/MATH/MISC/sources.cmake)
include(source/MATH/MISC/NNLS/sources.cmake)
include(source/DATASTRUCTURES/sources.cmake)
include(source/METADATA/sources.cmake)
include(source/KERNEL/sources.cmake)
include(source/CHEMISTRY/sources.cmake)
include(source/CHEMISTRY/MASSDECOMPOSITION/IMS/sources.cmake)
include(source/CHEMISTRY/MASSDECOMPOSITION/sources.cmake)
include(source/FORMAT/DATAACCESS/sources.cmake)
include(source/FORMAT/HANDLERS/sources.cmake)
include(source/FORMAT/VALIDATORS/sources.cmake)
include(source/FORMAT/OPTIONS/sources.cmake)
include(source/FORMAT/sources.cmake)
include(source/ANALYSIS/QUANTITATION/sources.cmake)
include(source/ANALYSIS/SVM/sources.cmake)
include(source/ANALYSIS/MAPMATCHING/sources.cmake)
include(source/ANALYSIS/DECHARGING/sources.cmake)
include(source/ANALYSIS/ID/sources.cmake)
include(source/ANALYSIS/DENOVO/sources.cmake)
include(source/ANALYSIS/PIP/sources.cmake)
include(source/ANALYSIS/MRM/sources.cmake)
include(source/ANALYSIS/TARGETED/sources.cmake)
include(source/ANALYSIS/RNPXL/sources.cmake)
include(source/FILTERING/BASELINE/sources.cmake)
include(source/FILTERING/TRANSFORMERS/sources.cmake)
include(source/FILTERING/DATAREDUCTION/sources.cmake)
include(source/FILTERING/CALIBRATION/sources.cmake)
include(source/FILTERING/SMOOTHING/sources.cmake)
include(source/FILTERING/NOISEESTIMATION/sources.cmake)
include(source/FILTERING/ID/sources.cmake)
include(source/TRANSFORMATIONS/FEATUREFINDER/sources.cmake)
include(source/TRANSFORMATIONS/RAW2PEAK/sources.cmake)
include(source/COMPARISON/CLUSTERING/sources.cmake)
include(source/COMPARISON/SPECTRA/sources.cmake)
include(source/SIMULATION/sources.cmake)
include(source/SIMULATION/LABELING/sources.cmake)
if(NOT DISABLE_OPENSWATH)
  include(source/ANALYSIS/OPENSWATH/sources.cmake)
  include(source/ANALYSIS/OPENSWATH/DATAACCESS/sources.cmake)
endif(NOT DISABLE_OPENSWATH)
include(source/APPLICATIONS/sources.cmake)

set(OpenMS_sources_h  CACHE INTERNAL "This variable should hold all OpenMS sources at the end of the config step" )

## ATTENTION: The order of includes should be similar to the inclusion hierarchy
include(include/OpenMS/INTERFACES/sources.cmake)
include(include/OpenMS/CONCEPT/sources.cmake)
include(include/OpenMS/SYSTEM/sources.cmake)
include(include/OpenMS/MATH/MISC/sources.cmake)
include(include/OpenMS/MATH/MISC/NNLS/sources.cmake)
include(include/OpenMS/MATH/STATISTICS/sources.cmake)
include(include/OpenMS/DATASTRUCTURES/sources.cmake)
include(include/OpenMS/METADATA/sources.cmake)
include(include/OpenMS/KERNEL/sources.cmake)
include(include/OpenMS/CHEMISTRY/sources.cmake)
include(include/OpenMS/CHEMISTRY/MASSDECOMPOSITION/IMS/sources.cmake)
include(include/OpenMS/CHEMISTRY/MASSDECOMPOSITION/sources.cmake)
include(include/OpenMS/FORMAT/sources.cmake)
include(include/OpenMS/FORMAT/DATAACCESS/sources.cmake)
include(include/OpenMS/FORMAT/HANDLERS/sources.cmake)
include(include/OpenMS/FORMAT/VALIDATORS/sources.cmake)
include(include/OpenMS/FORMAT/OPTIONS/sources.cmake)

include(include/OpenMS/ANALYSIS/DECHARGING/sources.cmake)
include(include/OpenMS/ANALYSIS/ID/sources.cmake)
include(include/OpenMS/ANALYSIS/DENOVO/sources.cmake)
include(include/OpenMS/ANALYSIS/MAPMATCHING/sources.cmake)
include(include/OpenMS/ANALYSIS/QUANTITATION/sources.cmake)
include(include/OpenMS/ANALYSIS/SVM/sources.cmake)
include(include/OpenMS/ANALYSIS/PIP/sources.cmake)
include(include/OpenMS/ANALYSIS/MRM/sources.cmake)
include(include/OpenMS/ANALYSIS/TARGETED/sources.cmake)
include(include/OpenMS/ANALYSIS/RNPXL/sources.cmake)

include(include/OpenMS/COMPARISON/CLUSTERING/sources.cmake)
include(include/OpenMS/COMPARISON/SPECTRA/sources.cmake)
include(include/OpenMS/FILTERING/BASELINE/sources.cmake)
include(include/OpenMS/FILTERING/CALIBRATION/sources.cmake)
include(include/OpenMS/FILTERING/DATAREDUCTION/sources.cmake)
include(include/OpenMS/FILTERING/ID/sources.cmake)
include(include/OpenMS/FILTERING/NOISEESTIMATION/sources.cmake)
include(include/OpenMS/FILTERING/SMOOTHING/sources.cmake)
include(include/OpenMS/FILTERING/TRANSFORMERS/sources.cmake)
include(include/OpenMS/TRANSFORMATIONS/FEATUREFINDER/sources.cmake)
include(include/OpenMS/TRANSFORMATIONS/RAW2PEAK/sources.cmake)
include(include/OpenMS/SIMULATION/sources.cmake)
include(include/OpenMS/SIMULATION/LABELING/sources.cmake)
if(NOT DISABLE_OPENSWATH)
  include(include/OpenMS/ANALYSIS/OPENSWATH/sources.cmake)
  include(include/OpenMS/ANALYSIS/OPENSWATH/DATAACCESS/sources.cmake)
endif(NOT DISABLE_OPENSWATH)
include(include/OpenMS/APPLICATIONS/sources.cmake)

## add configured config.h&Co to source group
source_group("Header Files\\OpenMS" FILES ${OpenMS_configured_headers})
## merge all headers to sources (for source group view in VS)
list(APPEND OpenMS_sources ${OpenMS_sources_h} ${OpenMS_configured_headers})

# TODO track why the duplicate warnings are thrown for all (!) MOC sources
# Macro problem?
list(REMOVE_DUPLICATES OpenMS_sources)
