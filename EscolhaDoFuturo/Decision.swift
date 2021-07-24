class Decision {
    
    var choicesQty: Int,
        choicesLabel: [String],
        question: String,
        answers: [[Any]]
    
    init(choicesQty: Int, choicesLabel: [String], question: String, answers: [[Any]]) {
        self.choicesQty = choicesQty
        self.choicesLabel = choicesLabel
        self.question = question
        self.answers = answers
    }
}
