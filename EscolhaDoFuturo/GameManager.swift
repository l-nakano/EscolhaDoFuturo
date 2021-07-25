import Foundation

class GameManager {
    static var shared = GameManager()
    
    private init() {}
    
    let textsList = [
        "João tem 17 anos e irá morar sozinho pela primeira vez.\nDesde de criança ele guardava um pouco de dinheiro para comprar seus álbuns de figurinhas preferidos.",
        "Gastava pouco com coisas que não lhe eram úteis, mas sempre foi um colecionador de coisas, desde camisetas de times de futebol à moedas que encontrava na rua.",
        "Ele nunca teve muito medo de perder suas coisas, mas as preservava para que durassem mais tempo.",
        "Desde cedo seu pai depositava dinheiro em uma poupança, para que João pudesse utilizar quando mais velho. Ao todo, João tem \(9000.currencyBR).",
        "Ele queria muito comprar um computador de \(7000.currencyBR) para se divertir no tempo livre. Este sempre foi seu sonho, já que nunca teve dinheiro para ter um somente para si.",
        "O pai de João continuava lhe dando \(500.currencyBR) para ele gastar com o que quisesse. Ele poderia sair, comprar jogos de computador, ir aos jogos de futebol do seu time ou poupar.",
        "Mas João tinha amigos que gostavam de \"dar rolê\" todos os fins de semana. Caso alguém furasse algum dos encontros, praticamente era excluído do grupo.",
        "Depois de 6 meses, João conseguiu um emprego para trabalhar como técnico de mecânica em uma grande montadora de carros. Recebia um salário líquido de \(1200.currencyBR) por mês.",
        "Ele se interessava por canais de televisão por assinatura que sempre quis assistir, e verificou que isso resultaria em um gasto de \(450.currencyBR) mensais.",
        "Na mesma época, conheceu sua namorada, mas que era muito consumista, adorava sair sempre e receber presentes todos os meses.",
        "Presumiu que gastaria \(600.currencyBR) por mês com ela, mas não pensou em nenhum momento em não incluir este gasto mensal.",
        "O que sobrava, ele poupava.",
        "Após 1 ano, João decidiu que gostaria de comprar uma moto esportiva, pois gostava desde pequeno. O valor total era de \(45000.currencyBR). Seu pai lhe disse que poderia dar a entrada como presente (\(13500.currencyBR)).",
        "Ele morava perto do trabalho, mas precisava pegar 2 ônibus para ir até a casa da namorada.",
        "O financiamento seria de \(31500.currencyBR), pago em 36 meses, sendo a parcela de \(1945.72.currencyBR) por mês.",
        "Depois de 2 anos, João foi demitido de seu emprego, ficando revoltado com a situação.",
        "Além disso, foi vítima de um assalto durante um passeio com a namorada. João foi ferido e precisou passar por uma cirurgia delicada.",
        "Não tinha plano de saúde e não poderia aguardar pelo atendimento no sistema de saúde público, tendo de fazer em uma rede particular. Ao todo, teve de desembolsar \(100000.currencyBR)."
    ]
    
    let motoFV: () -> Float = {
        shared.FV = Float(13500)
        shared.PMT = Float(1945.72)
        let n = 36
        shared.FV = shared.FV * powf((1 + shared.i()), Float(n)) + shared.PMT * (powf((1 + shared.i()), Float(n)) - 1) / shared.i()
        return shared.FV
    }
    
    let nPer: () -> Int = {
        return Int(ceil((log(((-shared.PMT / shared.i()) - 45000) / ((-shared.PMT / shared.i()) - 13500)) / log(1 + shared.i()))))
    }
    
    static let moralScenesList = [
        "Caso João optasse por investir os \(13500.currencyBR) que seu pai lhe deu para comprar a moto e, mensalmente, investir o valor da parcela, de \(1945.72.currencyBR), ao final de 36 meses ele teria \(shared.motoFV().currencyBR)",
        "Assim, compraria a moto e sobrariam \((shared.FV - 45000).currencyBR). Dessa maneira, ele economizaria R$\((13500 + shared.PMT * 36 - 45000).currencyBR) ao não fazer o financiamento.",
        "Caso quisesse comprar a moto assim que tivesse o dinheiro à vista, João poderia comprá-la em \(shared.nPer()) meses.",
        "Um ponto muito importante que precisa ser levado em consideração por todas as pessoas é a construção de um fundo de emergência.",
        "Ele é utilizado para situações emergenciais, como o acidente que João passou, uma ajuda a um familiar, a perda da renda mensal.",
        "É aconselhado ter uma reserva de emergência que seja 6 a 12 vezes o valor da renda familiar mensal. Dessa maneira, é possível viver mais tranquilo sem tanta pressão de precisar trabalhar apenas para ganhar dinheiro e pagar as contas.",
        "Outro ponto fundamental para um bom poupador é não antecipar seus sonhos. João pode poupar bastante só de economizar e comprar a moto à vista.",
        "Esperar ter o dinheiro é melhor do que correr o risco de se endividar ou passar sufoco pela antecipação de um sonho.",
        "End"
    ]
    
    let finalSceneList: () -> String = {
        shared.FV -= 100000
        if shared.hasMoto {
            if shared.FV > 0 {
                return "Como João tinha poupado durante os últimos anos, conseguiu pagar o tratamento e ficou com \(shared.FV.currencyBR) para os gastos mensais até encontrar um novo emprego e até mesmo passar por outro imprevisto. Ainda poderia continuar pagando o financiamento da sua moto."
            } else {
                return "Como João preferiu viver uma vida com maiores gastos, não teve dinheiro para pagar o tratamento e ficou endividado. Ainda teria que renegociar o seu financiamento, piorando ainda mais a sua situação financeira."
            }
        } else {
            if shared.FV > 0 {
                return "Como João tinha poupado durante os últimos anos, conseguiu pagar o tratamento e ficou com \(shared.FV.currencyBR) em sua poupança para os gastos mensais até encontrar um novo emprego e até mesmo passar por outro imprevisto."
            } else {
                return "Como João preferiu viver uma vida com maiores gastos, não teve dinheiro para pagar o tratamento e precisou pegar dinheiro emprestado, ficando endividado."
            }
        }
    }
    
    let decisionsList = [
        3: Decision(choicesQty: 3, choicesLabel: ["Conservador", "Moderado", "Agressivo"], question: "Sabendo disso, qual você acha que seria o perfil de investidor de João?", answers: [[PerfisInvestidor.conservador, Float(0), Float(0), false], [PerfisInvestidor.moderado, Float(0), Float(0), false], [PerfisInvestidor.agressivo, Float(0), Float(0), false]]),
        5: Decision(choicesQty: 2, choicesLabel: ["Compraria o computador", "Pouparia o dinheiro"], question: "O que você faria no lugar de João?", answers: [[PerfisInvestidor.nenhum, Float(2000), Float(0), false], [PerfisInvestidor.nenhum, Float(9000), Float(0), false]]),
        7: Decision(choicesQty: 2, choicesLabel: ["Sairia com os amigos", "Guardaria a mesada"], question: "Qual decisão você tomaria no lugar de João?", answers: [[PerfisInvestidor.nenhum, Float(0), Float(0), false], [PerfisInvestidor.nenhum, Float(0), Float(500), false]]),
        12: Decision(choicesQty: 2, choicesLabel: ["Assinaria o pacote de televisão", "Não assinaria o pacote de televisão"], question: "Qual seria a sua escolha?", answers: [[PerfisInvestidor.nenhum, Float(0), Float(150), false], [PerfisInvestidor.nenhum, Float(0), Float(600), false]]),
        15: Decision(choicesQty: 2, choicesLabel: ["Pegaria o presente do pai e pouparia", "Compraria a moto"], question: "Qual seria a sua atitude?", answers: [[PerfisInvestidor.nenhum, Float(13500), Float(900), false], [PerfisInvestidor.nenhum, Float(0), Float(-1045.72), true]])
    ]
    
    let timePastList = [
        7: 6,
        12: 12,
        15: 24
    ]
    
    var control = 0,
        FV: Float = 0.0,
        PMT: Float = 0.0,
        hasMoto = false,
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
