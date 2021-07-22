class GameSingleton {
    static var sharedVariables = GameSingleton()
    
    private init() {}
    
    let textsList = [
        "João tem 17 anos e irá morar sozinho pela primeira vez.\nDesde de criança ele guardava um pouco de dinheiro para comprar seus álbuns de figurinhas preferidos.",
        "Gastava pouco com coisas que não lhe eram úteis, mas sempre foi um colecionador de coisas, desde camisetas de times de futebol à moedas que encontrava na rua.",
        "Ele nunca teve muito medo de perder suas coisas, mas as preservava para que durassem mais tempo.",
        "Desde cedo seu pai depositava dinheiro em uma poupança, para que João pudesse utilizar quando mais velho. Ao todo, João tem R$ 9.000,00.",
        "Ele queria muito comprar um computador de R$ 7.000,00 para se divertir no tempo livre. Este sempre foi seu sonho, já que nunca teve dinheiro para ter um somente para si.",
        "O pai de João continuava lhe dando R$ 500,00 para ele gastar com o que quisesse. Ele poderia sair, comprar jogos de computador, ir aos jogos de futebol do seu time ou poupar.",
        "Mas João tinha amigos que gostavam de \"dar rolê\" todos os fins de semana. Caso alguém furasse algum dos encontros, praticamente era excluído do grupo.",
        "Depois de 6 meses, João conseguiu um emprego para trabalhar como técnico de mecânica em uma grande montadora de carros. Recebia um salário líquido de R$ 1.200,00 por mês.",
        "Ele se interessava por canais de televisão por assinatura que sempre quis assistir, e verificou que isso resultaria em um gasto de R$ 450,00 mensais.",
        "Na mesma época, conheceu sua namorada, mas que era muito consumista, adorava sair sempre e receber presentes todos os meses.",
        "Presumiu que gastaria R$ 600,00 por mês com ela, mas não pensou em nenhum momento em não incluir este gasto mensal.",
        "O que sobrava, ele poupava.",
        "Após 1 ano, João decidiu que gostaria de comprar uma moto esportiva, pois gostava desde pequeno. O valor total era de R$ 45.000,00. Seu pai lhe disse que poderia dar a entrada como presente (R$ 13.500,00).",
        "Ele morava perto do trabalho, mas precisava pegar 2 ônibus para ir até a casa da namorada.",
        "O financiamento seria de R$ 31.500,00, pago em 36 meses, sendo a parcela de R$ 1.945,72 por mês.",
        "Depois de 2 anos, João foi demitido de seu emprego, ficando revoltado com a situação.",
        "Além disso, foi vítima de um assalto durante um passeio com a namorada. João foi ferido e precisou passar por uma cirurgia delicada.",
        "Não tinha plano de saúde e não poderia aguardar pelo atendimento no sistema de saúde público, tendo de fazer em uma rede particular. Ao todo, teve de desembolsar R$ 100.000,00."
    ]
    
    let decisionsList = [3: "FirstDecision",
                         7: "SecondDecision",
                         10: "ThirdDecision",
                         15: "FourthDecision",
                         19: "FifthDecision"]
    
    var textController = 0
    
    var perfilInvestidor: PerfisInvestidor = .conservador
}
