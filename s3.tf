resource "aws_s3_bucket" "bucket" {
    bucket = "moehrke-co-webpage"
}

resource "aws_s3_bucket_public_access_block" "bucket" {
    bucket = aws_s3_bucket.bucket.id
}

resource "aws_s3_bucket_ownership_controls" "bucket" {
    bucket = aws_s3_bucket.bucket.id
    rule {
        object_ownership = "BucketOwnerEnforced"
    }
}

resource "aws_s3_bucket_website_configuration" "bucket" {
    bucket = aws_s3_bucket.bucket.id
    index_document {
        suffix = "index.html"
    }
}
