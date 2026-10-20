Hippocampal Dendritic Spine Density in Female Rats

Overview

This repository contains the data and analysis scripts supporting the study investigating differences in hippocampal CA1 pyramidal neuron dendritic spine density and maturation across the estrous cycle and following exposure to synthetic hormones used in hormonal contraceptives.

The study examined gonadally intact female Long-Evans rats assigned to one of six groups: diestrus, proestrus, estrus, ethinyl estradiol (EE), levonorgestrel (LNG), or combined ethinyl estradiol and levonorgestrel (EE+LNG).

Dendritic spines were quantified in Golgi-stained CA1 pyramidal neurons, with measurements obtained from basal and apical dendrites.

Repository Contents

Spines_data.csv — Dataset containing dendritic spine measurements and associated experimental group information.

HC_Spines.R — R scripts used for statistical analyses and figure generation.

Experimental Groups

The study included the following groups:

Diestrus: Rats assessed during the diestrus phase of the estrous cycle.

Proestrus: Rats assessed during the proestrus phase of the estrous cycle.

Estrus: Rats assessed during the estrus phase of the estrous cycle.

EE: Rats administered ethinyl estradiol.

LNG: Rats administered levonorgestrel.

EE+LNG: Rats administered both ethinyl estradiol and levonorgestrel.

The vehicle-treated rats were assigned to estrous-cycle groups based on vaginal cytology. Synthetic hormone-treated rats exhibited disrupted cyclicity, with cytology generally resembling diestrus.

Dataset Description

The dataset contains dendritic spine measurements obtained from Golgi-stained hippocampal CA1 pyramidal neurons.

Each rat contributed measurements from five neurons, with two dendrites assessed per neuron. Measurements were collected from basal and apical dendrites.

The dataset includes variables describing experimental group, animal identity, neuron identity, dendrite type, and dendritic spine measurements. 

Statistical Analysis

Statistical analyses were conducted in R (version 4.5.1).

Linear mixed-effects models were used to analyze dendritic spine density while accounting for the nested structure of the data. Animal identity and neuron identity were included as random effects where appropriate.

Mature spine proportions were analyzed using a binomial generalized linear mixed-effects model and/or animal-level pooled proportions, as appropriate for the reported analysis.

Details of the statistical models, post hoc comparisons, and effect-size calculations are provided in the associated manuscript and analysis scripts, where available.
