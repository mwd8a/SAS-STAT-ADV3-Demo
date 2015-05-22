Advanced SAS Demo 3: Survival Analysis
======================================

## Overview

Examples of *survival analysis* are given for two data sets. The first data set is simple, and the *Kaplan-Meier estimator* is given "by hand" as a warm up. Then the survival curve is obtained in SAS. The second data set is a more in-depth survival analysis of a complex data set using SAS. The two data sets PATIENTS and PBC are created by running the code in **patients_pbc_raw.sas**. *Censored* patients are defined as those patients who reached the endpoint of the study without dying or are lost to follow-up.

The data set PATIENTS has variables 

* **SUBJECT** for patient (or subject id)
* **DUR** for duration of time in the clinical trial (in years)
* **STATUS** for status: 0 (for non-censored) and 1 (for censored)

The data set PBC has variables

* **ID** for subject id
* **DAYS** for the number of days between registration and the earlier of death or termination of  follow-up
* **EVENT** for event: 1 (if time to death) or 2 (if time to censoring)
* **TREATMENT** for treatment: 1 (for D-pencillamine) and 2 (for placebo)
* **ALBUMIN** for Albumin (in gm/dl)
* **ALBUMIN_HI** for Albumin Level: 1 (if ALBUMIN > 3.55) and 0 otherwise
* **STAGE** for histologic state of disease: graded 1, 2, 3, or 4

The file **SAS_Adv3.sas** contains the SAS code from the analysis. The SAS output can be viewed in the file **Results / SAS_Adv3.sas.pdf**. 

A detailed account of the analysis can be read in the file **SAS_Stat_Adv3.pdf**.

## Part 1A

No SAS is used for this part.

## Part 1B

The survival plot for the data in PATIENTS is created using PROC LIFETEST.

## Part 2

The log-rank test is used to compare survival between the two treatment groups in the PBC data set. Survival curves by group are also produced. All of this is accomplished by using PROC LIFETEST.

## Part 3A

A Cox regression model is analyzed for the PBC data set using PROC PHREG. Results about the relative risk of death with respect to the (continuous) ALBUMIN variable are found. 

## Part 3B

A Cox regression model is analyzed for the PBC data set using PROC PHREG. Results about the relative risk of death with respect to the (categorical) ALBUMIN\_HI variable are found. 

## Part 3C

A Cox regression model is analyzed for the PBC data set using PROC PHREG. As in Part 3B, results about the relative risk of death with respect to the (categorical) ALBUMIN_HI variable are found. This time, the variable STAGE is introduced into the model to see whether or not STAGE is a confounder for the association between ALBUMIN\_HI and the risk of death. 