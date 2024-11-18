variable "value" {
  description = "Input string to check for uppercase letters"
  type        = string
  # default     = "Hello World"
  default     = "hello world"
   
  validation {
    error_message = "The string must contain at least one uppercase letter."
    condition     = length(regexall("[A-Z]", var.value)) == 0
  }
}



variable "in_the_end_there_can_be_only_one" {
  description = "Who is better Connor or Duncan?"
  type = object({
    Dunkan = optional(bool)
    Connor = optional(bool)
  })
  
  default = {
    Dunkan = true
    Connor = false
  }
  /*
   default = {
        Dunkan = true
        Connor = true
    }
  */

  validation {
    error_message = "There can be only one MacLeod"
    condition     = (length([for v in [var.in_the_end_there_can_be_only_one.Dunkan, var.in_the_end_there_can_be_only_one.Connor] : v if v == true || v == false]) == 2) && (var.in_the_end_there_can_be_only_one.Dunkan != var.in_the_end_there_can_be_only_one.Connor)
  }

}


