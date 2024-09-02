#create s3 bucket
resource "aws_s3_bucket" "cgss" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "cgss-owner" {
  bucket = aws_s3_bucket.cgss.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "cgss-access" {
  bucket = aws_s3_bucket.cgss.id

  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "cgss-acl" {
   depends_on = [ aws_s3_bucket_ownership_controls.cgss-owner, 
   aws_s3_bucket_public_access_block.cgss-access ]
   bucket = aws_s3_bucket.cgss.id
  acl = "public-read"
}

resource "aws_s3_object" "index_html" {
    bucket = aws_s3_bucket.cgss.id
    key    = "index.html"
    source = "index.html"
    acl = "public-read"
    content_type = "text/html"
    depends_on = [ aws_s3_bucket_acl.cgss-acl ]
  }

resource "aws_s3_object" "styles_css" {
    bucket = aws_s3_bucket.cgss.id
    key    = "styles.css"
    source = "styles.css"
    acl = "public-read"
    content_type = "text/css"
    depends_on = [ aws_s3_bucket_acl.cgss-acl ]
  }

resource "aws_s3_object" "error_html" {
    bucket = aws_s3_bucket.cgss.id
    key    = "error.html"
    source = "error.html"
    acl = "public-read"
    content_type = "text/html"
    depends_on = [ aws_s3_bucket_acl.cgss-acl ]
  }

resource "aws_s3_object" "profile_image" {
    bucket = aws_s3_bucket.cgss.id
    key    = "profile.jpeg"
    source = "profile.jpeg"
    acl = "public-read"
    content_type = "image/jpeg"
    depends_on = [ aws_s3_bucket_acl.cgss-acl ]
  }

resource "aws_s3_bucket_website_configuration" "profile-website" {
  bucket = aws_s3_bucket.cgss.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
  depends_on = [ aws_s3_bucket_acl.cgss-acl ]
}