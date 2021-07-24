import Foundation

class GameManager {
    static var shared = GameManager()
    
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
    
    let decisionsList = [
        3: Decision(choicesQty: 3, choicesLabel: ["Conservador", "Moderado", "Agressivo"], question: "Sabendo disso, qual você acha que seria o perfil de investidor de João?", answers: [[PerfisInvestidor.conservador, Float(0), Float(0)], [PerfisInvestidor.moderado, Float(0), Float(0)], [PerfisInvestidor.agressivo, Float(0), Float(0)]]),
        5: Decision(choicesQty: 2, choicesLabel: ["Compraria o computador", "Pouparia o dinheiro"], question: "O que você faria no lugar de João?", answers: [[PerfisInvestidor.nenhum, Float(2000), Float(0)], [PerfisInvestidor.nenhum, Float(9000), Float(0)]]),
        7: Decision(choicesQty: 2, choicesLabel: ["Sairia com os amigos", "Guardaria a mesada"], question: "Qual decisão você tomaria no lugar de João?", answers: [[PerfisInvestidor.nenhum, Float(0), Float(0)], [PerfisInvestidor.nenhum, Float(0), Float(500)]]),
        12: Decision(choicesQty: 2, choicesLabel: ["Assinaria o pacote de televisão", "Gastaria apenas com a namorada"], question: "Qual seria a sua escolha?", answers: [[PerfisInvestidor.nenhum, Float(0), Float(150)], [PerfisInvestidor.nenhum, Float(0), Float(600)]]),
        15: Decision(choicesQty: 2, choicesLabel: ["Pegaria o presente do pai e pouparia", "Compraria a moto"], question: "Qual seria a sua atitude?", answers: [[PerfisInvestidor.nenhum, Float(13500), Float(900)], [PerfisInvestidor.nenhum, Float(0), Float(900)]])
    ]
    
    let timePastList = [
        7: 6,
        12: 12,
        15: 24
    ]
    
    var control = 0,
        FV: Float = 0.0,
        PMT: Float = 0.0,
        perfilInvestidor: PerfisInvestidor = .nenhum
    
    let i: () -> Float = {
        switch shared.perfilInvestidor {
        case .conservador:
            return 0.02
        case .moderado:
            return 0.04
        case .agressivo:
            return 0.06
        case .nenhum:
            return 0.0
        }
    }
}
