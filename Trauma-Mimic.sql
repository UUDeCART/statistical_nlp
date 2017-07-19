select n.text
             from noteevents n 
             join (select  dx.subject_id, dx.hadm_id
                   from noteevents n 
                   join icd9 dx on n.subject_id = dx.subject_id 
                                 and n.hadm_id = dx.hadm_id
                                 and n.category = 'RADIOLOGY_REPORT'
                    where (1 = 1)
                        and dx.sequence = 1
                        and dx.code >= '800'
                        and dx.code <= '999') dt
             on n.subject_id = dt.subject_id
             and n.hadm_id = dt.hadm_id
limit 2000