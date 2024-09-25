resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "high_cpu_alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "Triggered when CPU utilization exceeds 80%"
  dimensions = {
    InstanceId = var.ec2_instance_ids[0]
  }

  actions_enabled = true
  alarm_actions   = [aws_sns_topic.topic.arn]
}

resource "aws_sns_topic" "topic" {
  name = "alarms"
}

resource "aws_sns_topic_subscription" "subscription" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = var.alarm_email
}
