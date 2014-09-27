find . \( -iname '*.h' -or -iname '*.cpp' \) -exec grep -iEH ranap_id_RAB_SetupList_RelocReq {} \;
