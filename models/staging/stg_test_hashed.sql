{{
    dbtvault.stage(
        source_model = {
            "gnpd": "test_eff_sat"
        },
        hashed_columns = {
            "hk_a": "fk_a",
            "hk_b": "fk_b",
            "hk_a_b": [
                "fk_a",
                "fk_b"
            ]
        },
        derived_columns = {
            "loaddate": "_fivetran_synced",
            "source": "!gnpd",
            "is_active": "not _fivetran_deleted",
            "start_date": "loaddate",
            "end_date": "CASE WHEN not _fivetran_deleted THEN '9999-12-31' ELSE loaddate END",
            "effective_from_date": "loaddate",
            "bk_a": "fk_a",
            "bk_b": "fk_b"
        },
    )
}}
