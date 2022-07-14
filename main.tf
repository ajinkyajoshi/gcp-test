resource "google_monitoring_alert_policy" "alert_policy" {
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
