resource "aws_cloudtrail" "this" {
  name                          = "global-cloudtrail"
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  s3_bucket_name                = var.s3_bucket_name
  include_global_service_events = true
  cloud_watch_logs_group_arn    = "${var.cloudwatch_log_group_arn}:*"
  cloud_watch_logs_role_arn     = aws_iam_role.cloudtrail_log_role.arn

  depends_on = [
    var.depends_on_cloudwatch_log_group,
    var.depends_on_s3_bucket_object,
    aws_iam_role_policy_attachment.attach_policy,
    aws_iam_role_policy_attachment.attach_cloudtrail_policy
  ]
}



resource "aws_iam_role" "cloudtrail_log_role" {
  name = "cloudtrail_log_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Principal = {
        Service = "cloudtrail.amazonaws.com"
      }
      Effect = "Allow"
      Sid    = ""
    }]
  })
}

resource "aws_iam_policy" "cloudtrail_policy" {
  name = "cloudtrail-logs"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "${var.cloudwatch_log_group_arn}:*"
      }
    ]
  })
}

resource "aws_iam_policy" "cloudtrail_s3_policy" {
  name = "cloudtrail-logs-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:PutObject"
        Resource = "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "attach_cloudtrail_policy" {
  role       = aws_iam_role.cloudtrail_log_role.name
  policy_arn = aws_iam_policy.cloudtrail_s3_policy.arn
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.cloudtrail_log_role.name
  policy_arn = aws_iam_policy.cloudtrail_policy.arn
}

output "cloudtrail_log_role_arn" {
  value = aws_iam_role.cloudtrail_log_role.arn
}
