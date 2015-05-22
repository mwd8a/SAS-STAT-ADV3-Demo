/* first, run patients_pbc_raw.sas to create sas data sets PATIENTS and PBC in the work directory */

/** Part 1B **/

/* produce the survival curve */
proc lifetest data=patients plots=survival;
	time dur*status (0);
run;

/** Part 2 **/

/* produce the survival curves */
proc lifetest data=pbc plots=survival;
	time days*event (0);
	strata treatment;
run;

/** Part 3A **/

proc phreg data=pbc;
	model days*event (0) = albumin /ties=exact rl=pl;
run;

/** Part 3B **/

proc phreg data=pbc;
	class albumin_hi (param=ref ref='0');
	model days*event (0) = albumin_hi /ties=exact rl=pl;
run;

/** Part 3C **/

proc phreg data=pbc;
	class albumin_hi (param=ref ref='0') stage (param=ref ref='1');
	model days*event (0) = albumin_hi stage /ties=exact rl=pl;
run;