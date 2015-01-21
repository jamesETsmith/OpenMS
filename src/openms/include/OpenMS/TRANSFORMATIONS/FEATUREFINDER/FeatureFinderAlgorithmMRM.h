// --------------------------------------------------------------------------
//                   OpenMS -- Open-Source Mass Spectrometry
// --------------------------------------------------------------------------
// Copyright The OpenMS Team -- Eberhard Karls University Tuebingen,
// ETH Zurich, and Freie Universitaet Berlin 2002-2015.
//
// This software is released under a three-clause BSD license:
//  * Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
//  * Neither the name of any author or any participating institution
//    may be used to endorse or promote products derived from this software
//    without specific prior written permission.
// For a full list of authors, refer to the file AUTHORS.
// --------------------------------------------------------------------------
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL ANY OF THE AUTHORS OR THE CONTRIBUTING
// INSTITUTIONS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// --------------------------------------------------------------------------
// $Maintainer: Andreas Bertsch $
// $Authors: Andreas Bertsch $
// --------------------------------------------------------------------------

#ifndef OPENMS_TRANSFORMATIONS_FEATUREFINDER_FEATUREFINDERALGORITHMMRM_H
#define OPENMS_TRANSFORMATIONS_FEATUREFINDER_FEATUREFINDERALGORITHMMRM_H

#include <OpenMS/TRANSFORMATIONS/FEATUREFINDER/FeatureFinderAlgorithm.h>

namespace OpenMS
{
  class InterpolationModel;

  /**
    @brief FeatureFinderAlgorithm for MRM experiments.

    @experimental This tool has not been tested thoroughly and might behave not as expected!

    This very simple algorithm has mainly been tested on data generated
    on an ABI/SCIEX QTrap 4000. Maybe this algorithm cannot be directly
    applied on data generated by other mass spectrometers.

    Precursor m/z information (Q1) is stored in the "MZ" metavalue of each feature!
    The feature's m/z itself is the Q3's ion m/z.

    @htmlinclude OpenMS_FeatureFinderAlgorithmMRM.parameters

    @ingroup FeatureFinder
  */
  class OPENMS_DLLAPI FeatureFinderAlgorithmMRM :
    public FeatureFinderAlgorithm,
    public FeatureFinderDefs
  {
public:
    ///@name Type definitions
    //@{
    typedef FeatureFinderAlgorithm::MapType MapType;
    typedef MapType::SpectrumType SpectrumType;
    typedef SpectrumType::FloatDataArrays FloatDataArrays;
    //@}

    using FeatureFinderAlgorithm::param_;
    using FeatureFinderAlgorithm::features_;
    using FeatureFinderAlgorithm::ff_;
    using FeatureFinderAlgorithm::defaults_;
    using FeatureFinderAlgorithm::map_;

public:

    enum
    {
      RT = Peak2D::RT,
      MZ = Peak2D::MZ
    };

    /// default constructor
    FeatureFinderAlgorithmMRM();

    /// Main method for actual FeatureFinder
    virtual void run();

    static FeatureFinderAlgorithm* create();

    static const String getProductName();

protected:

    double fitRT_(std::vector<Peak1D>& rt_input_data, InterpolationModel*& model) const;

    //Docu in base class
    virtual void updateMembers_();
  };

} // namespace OpenMS

#endif // OPENMS_TRANSFORMATIONS_FEATUREFINDER_FEATUREFINDERALGORITHMMRM_H
