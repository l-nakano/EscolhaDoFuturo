class Decision {
    
    var choicesQty: Int,
        choicesLabel: [String],
        question: String,
        answers: [Any],
        varToChange: varToChange
    
    init(choicesQty: Int, choicesLabel: [String], question: String, answers: [Any], varToChange: varToChange) {
        self.choicesQty = choicesQty
        self.choicesLabel = choicesLabel
        self.question = question
        self.answers = answers
        self.varToChange = varToChange
    }
}
