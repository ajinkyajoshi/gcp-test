/*resource "google_monitoring_alert_policy" "alert_policy" {
  project = "project-code"
  for_each = var.monitoring_alert_policy
    display_name = each.value.display_name
    combiner     = each.value.combiner
    conditions {
      display_name = each.value.condition_display_name
      condition_threshold {
        filter     = each.value.filter
        duration   = each.value.duration
        comparison = each.value.comparison
        aggregations {
          alignment_period   = each.value.alignment_period
          per_series_aligner = each.value.per_series_aligner
        }
      }
    }

  user_labels = {
    foo = "bar"
  }
}
*/
resource "google_monitoring_alert_policy" "alert_policy" {
  project = "project-code"
  for_each = var.monitoring_alert_policy
    display_name = each.value.display_name
    combiner     = each.value.combiner
    conditions {
      display_name = each.value.condition_display_name
      condition_threshold {
        filter     = each.value.filter AND each.value.filter1 AND each.value.filter2
        duration   = each.value.duration
        comparison = each.value.comparison
        aggregations {
          alignment_period   = each.value.alignment_period
          per_series_aligner = each.value.per_series_aligner
        }
      }
    }

 dynamic user_labels = {
    for_each var.labels
    content {
 severity = user_labels.value["severity"]
 resource = user_labels.value["resource.type"]
    }
  }
documentation {
  content = "telecom-interconnect-alert | P1 | DC Traffic Check"
}  
}  
