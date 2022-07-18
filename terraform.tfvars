"alert_policy" = {
        display_name = "Terraform-policy-1"
        combiner = "OR"
        condition_display_name = "Terraform-condition-1"
        filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\"" 
        filter1 = "resource.labels.project_id = \"cnr-hub-svpc\""
        filter2 = "resource.type=\"gce_instance\""
        duration       = "60s"
        comparison       = "COMPARISON_GT"
        alignment_period   = "60s"
        per_series_aligner       = "ALIGN_RATE"
        severity= "Critical"
        resource= "gce_instance"

    }
      "alert_policy VM1" = {
        display_name = "Terraform-policy-VM"
        combiner = "OR" 
        condition_display_name = "Terraform-condition-2"
        filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
        duration       = "120s"
        comparison       = "COMPARISON_GT"
        alignment_period   = "120s"
        per_series_aligner       = "ALIGN_RATE"
    } 
    "alert_policyVM2" = {
        display_name = "Terraform-policy-VM11"
        combiner = "OR"
        condition_display_name = "Terraform-condition-2"
        filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
        duration       = "120s"
        comparison       = "COMPARISON_GT"
        alignment_period   = "120s"
        per_series_aligner       = "ALIGN_RATE"
    }     
  
