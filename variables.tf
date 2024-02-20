variable "accounts" {
    type = map(string)
    description = "Mapping of aliases->IAM roles of accounts to rollout plans to"
    default = {
        "jcarlsonpurcell-personal" = "arn:aws:iam::509915386432:role/admin-cli",
        "jcarlsonpurcell-personal-testing" = "arn:aws:iam::138277128026:role/admin-cli",
        "jcarlsonpurcell-personal-testing-2" = "arn:aws:iam::685680125206:role/admin-cli"
    }
}