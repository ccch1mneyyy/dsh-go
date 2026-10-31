// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class L10nPt extends L10n {
  L10nPt([String locale = 'pt']) : super(locale);

  @override
  String get accessPickTitle => 'Como o DSH Go pode ajudar?';

  @override
  String get accessPickMessage => 'Escolha os recursos e ative cada permissão';

  @override
  String get accessPickConfirm => 'Ativar os selecionados';

  @override
  String get accessSkip => 'Pular';

  @override
  String get accessFeatureFiles => 'Ler e editar arquivos do celular';

  @override
  String get accessFeatureFilesNeeds => 'Requer acesso aos arquivos';

  @override
  String get accessFeaturePet => 'Mascote sobre outros aplicativos';

  @override
  String get accessFeaturePetNeeds => 'Requer permissão para exibir sobre outros aplicativos';

  @override
  String get accessFeaturePhone => 'Controle do celular';

  @override
  String get accessFeaturePhoneNeeds => 'Requer acessibilidade e notificações';

  @override
  String get accessFeatureBackground => 'Continuar em segundo plano';

  @override
  String get accessFeatureBackgroundNeeds =>
      'Avisa quando as tarefas terminam; requer notificações e acesso em segundo plano';

  @override
  String get accessFeatureVoice => 'Entrada de voz';

  @override
  String get accessFeatureVoiceNeeds => 'Requer microfone';

  @override
  String accessVoiceModel(int size) {
    return 'Funciona sem internet; baixa um modelo de voz de cerca de $size MB';
  }

  @override
  String get accessVoiceMetered => 'Você está usando dados móveis; o download consumirá esses dados';

  @override
  String get accessFilesRiskBody => 'A IA poderá ler e alterar suas fotos, downloads e documentos.';

  @override
  String accessStepCount(int index, int total) {
    return '$index / $total';
  }

  @override
  String get accessTurnOn => 'Ativar';

  @override
  String get accessOpenSettings => 'Abrir configurações';

  @override
  String get accessItsSet => 'Configurado';

  @override
  String get accessOpenAgain => 'Abrir novamente';

  @override
  String get accessIsOn => 'Ativado';

  @override
  String get accessNotOnYet => 'Ainda não ativado';

  @override
  String get accessDidYouSet => 'Você ativou a permissão?';

  @override
  String accessWhere(String path) {
    return 'Onde: $path';
  }

  @override
  String get accessOpenFailed => 'Não foi possível abrir as configurações do sistema';

  @override
  String get accessMicTitle => 'Permitir o microfone';

  @override
  String get accessMicWhy => 'Para entrada de voz';

  @override
  String get accessStorageTitle => 'Permitir acesso aos arquivos';

  @override
  String get accessStorageWhy => 'Permite que a IA leia e edite fotos, downloads e documentos';

  @override
  String get accessNotifyTitle => 'Permitir notificações';

  @override
  String get accessNotifyWhy => 'Avisa quando uma tarefa termina ou precisa de você';

  @override
  String get accessBatteryTitle => 'Permitir execução em segundo plano';

  @override
  String get accessBatteryWhy => 'As tarefas continuam quando você troca de aplicativo';

  @override
  String get accessVendorBackgroundWhy => 'Impede que o sistema interrompa tarefas em segundo plano';

  @override
  String get accessAutostartTitle => 'Permitir inicialização automática';

  @override
  String get accessAutostartWhy => 'Permite que o DSH Go volte a funcionar após ser encerrado pelo sistema';

  @override
  String accessVivoAutostartPath(String app) {
    return 'Gerenciamento de permissões › Inicialização automática › $app';
  }

  @override
  String accessXiaomiAutostartPath(String app) {
    return 'Gerenciar aplicativos › $app › Inicialização automática';
  }

  @override
  String get accessA11yTitle => 'Ativar acessibilidade';

  @override
  String get accessA11yWhy => 'O controle do celular lê a tela e toca nela';

  @override
  String get accessPopupTitle => 'Permitir janelas em segundo plano';

  @override
  String get accessPopupWhy => 'Traz você de volta ao DSH Go quando o controle do celular termina';

  @override
  String accessVivoPopupPath(String app) {
    return 'Gerenciamento de permissões › $app › Exibir janelas em segundo plano';
  }

  @override
  String accessXiaomiPopupPath(String app) {
    return 'Gerenciar aplicativos › $app › Outras permissões › Exibir janelas durante a execução em segundo plano';
  }

  @override
  String get accessOverlayTitle => 'Permitir exibição sobre outros aplicativos';

  @override
  String get accessOverlayWhy => 'Permite que o mascote apareça sobre outros aplicativos';

  @override
  String get accessOverlayGreyed => 'A opção está desativada?';

  @override
  String get accessRestrictedTitle => 'Permita primeiro as configurações restritas';

  @override
  String get accessRestrictedTap =>
      'Em Acessibilidade, toque em “Controle do celular pelo DSH”; quando aparecer “Configuração restrita”, toque em OK';

  @override
  String get accessRestrictedMenu =>
      'Nas informações do aplicativo, toque nos três pontos no canto superior direito e escolha “Permitir configurações restritas”';

  @override
  String get accessRestrictedAdvanced =>
      'Nas informações do aplicativo, abra “Configurações avançadas” e ative “Permitir configurações restritas”';

  @override
  String get accessRestrictedBack => 'Volte a Acessibilidade e ative “Controle do celular pelo DSH”';

  @override
  String get accessRestrictedHelp => 'Veja como';

  @override
  String get accessOpenA11y => 'Abrir Acessibilidade';

  @override
  String get accessOpenAppInfo => 'Abrir informações do aplicativo';

  @override
  String get accessStateOn => 'Ativado';

  @override
  String get accessStateOff => 'Desativado';

  @override
  String get accessStateVisited => 'Visitado';

  @override
  String get accessStateUnknown => 'Configurar';

  @override
  String get accessSummaryAllSet => 'Tudo pronto';

  @override
  String accessSummaryLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ainda desativados',
      one: '1 ainda desativado',
    );
    return '$_temp0';
  }

  @override
  String get accessSummaryMessage =>
      'Ative as outras permissões a qualquer momento em Configurações › Geral › Permissões do sistema';

  @override
  String get accessFinishFailed => 'Não foi possível concluir a configuração';

  @override
  String accessVoiceDownload(int size) {
    return 'O modelo de voz (cerca de $size MB) começa a ser baixado quando o mecanismo estiver pronto. Acompanhe em Configurações › Geral › Entrada de voz.';
  }

  @override
  String get accessPageTitle => 'Permissões do sistema';

  @override
  String get accessPageSubtitle => 'O que cada recurso requer do Android';

  @override
  String get activityThinkingUntangle => 'Deixa-me desembaraçar isto.';

  @override
  String get activityThinkingWorkThrough => 'Vamos resolver isto';

  @override
  String get activityThinkingGears => 'Engrenagens cerebrais a rodar';

  @override
  String get activityThinkingSecond => 'Dá-me um segundo.';

  @override
  String get activityThinkingSmoking => 'O cérebro está trabalhando horas extras';

  @override
  String get activityThinkingOnIt => 'Pensar, pensar';

  @override
  String get activityThinkingNoRush => 'Um pensamento de cada vez';

  @override
  String get activityThinkingPonder => 'Deixa-me pensar nisso.';

  @override
  String get activityThinkingLogic => 'Trabalhando através da lógica';

  @override
  String get activityThinkingBrain => 'Pôr o meu cérebro a trabalhar';

  @override
  String get activityThinkingSort => 'Deixa-me resolver isto.';

  @override
  String get activityThinkingMemory => 'À procura da minha memória';

  @override
  String get activityThinkingStorm => 'Brainstorming';

  @override
  String get activityThinkingSavor => 'Hmm... deixa isso entrar';

  @override
  String get activityThinkingMoment => 'Um momento, pensando';

  @override
  String get activityThinkingHeadScratch => 'A coçar a cabeça...';

  @override
  String get activityThinkingPlayOut => 'Vejamos para onde isso vai';

  @override
  String get activityThinkingLoading => 'Carregando pensamentos';

  @override
  String get activityThinkingMulling => 'A mudar de assunto.';

  @override
  String get activityThinkingBreakDown => 'Deixa-me explicar.';

  @override
  String get activityThinkingTrain => 'Todos a bordo do trem do pensamento';

  @override
  String get activityThinkingSomething => 'Hmm... há algo aqui';

  @override
  String get activityThinkingJog => 'Tomando esta idéia para uma corrida';

  @override
  String get activityThinkingPicture => 'Espera, consigo imaginar.';

  @override
  String get activityThinkingBubbles => 'Bolhas de pensamento';

  @override
  String get activityThinkingWaves => 'Ondas cerebrais a chegar';

  @override
  String get activityThinkingCoffee => 'O cérebro está passando um café';

  @override
  String get activityThinkingDraft => 'A redigir na minha cabeça';

  @override
  String get activityThinkingComing => 'Ah, está vindo para mim';

  @override
  String get activityThinkingBubbling => 'Idéias borbulhando';

  @override
  String get activityThinkingTackle => 'Hmm... vamos lidar com isso';

  @override
  String get activityThinkingSpark => 'Uma faísca de uma ideia';

  @override
  String get activityThinkingLogicFirst => 'Vamos classificar a lógica primeiro';

  @override
  String get activityThinkingLocate => 'Apontar o pino';

  @override
  String get activityThinkingInvestigate => 'Estou a investigar.';

  @override
  String get activityThinkingGif => 'thinking.gif';

  @override
  String get activityThinkingLook => 'Deixa-me ver.';

  @override
  String get activityThinkingInteresting => 'Interessante.';

  @override
  String get activityThinkingHands => 'A aquecer o meu cérebro';

  @override
  String get activityThinkingFiveMinutes => 'Cinco minutos. Grande projecto';

  @override
  String get activityThinkingSerious => 'Hora de ficar sério';

  @override
  String get activityThinkingTricky => 'Isto é um pouco complicado.';

  @override
  String get activityThinkingAscend => 'Alcançar um plano superior';

  @override
  String get activityThinkingAlmostPromise => 'Quase lá, prometo.';

  @override
  String get activityThinkingLongWay => 'Apanhou a rota panorâmica';

  @override
  String get activityThinkingWrapping => 'A embrulhar as coisas.';

  @override
  String get activityThinkingSong => 'Dê-me o valor de uma canção';

  @override
  String get activityThinkingBigMove => 'Preparando a grande jogada';

  @override
  String get activityThinkingSimple => 'Um pedido fácil. Ou é?';

  @override
  String get activityThinkingOneMinute => 'Um minuto, ainda estou a pensar';

  @override
  String get activityThinkingChallenge => 'Agora isso é um desafio';

  @override
  String get activityThinkingDig => 'Deixe-me cavar mais fundo';

  @override
  String get activityThinkingNotSimple => 'Há mais do que isso';

  @override
  String get activityThinkingDeep => 'Estou a aprofundar-me nisso.';

  @override
  String get activityThinkingBurning => 'Células cerebrais disparando';

  @override
  String get activityThinkingNearlyClear => 'Quase percebi.';

  @override
  String get activityThinkingTwisty => 'Este é um pouco twisty...';

  @override
  String get activityThinkingWorkout => 'Fazer exercício no meu cérebro...';

  @override
  String get activityThinkingStay => 'Fica comigo, quase lá.';

  @override
  String get activityThinkingCloser => 'Deixa-me pensar nisto.';

  @override
  String get activityThinkingThirtySeconds => 'Trinta segundos, ainda está lá.';

  @override
  String get activityThinkingSoon => 'Aguente firme, quase lá.';

  @override
  String get activityThinkingAnotherPass => 'Deixa-me passar outra vez.';

  @override
  String get activityThinkingTrack => 'Ainda no trilho';

  @override
  String get activityThinkingLead => 'A chegar a algum lado.';

  @override
  String get activityThinkingCircles => 'Andando em círculos...';

  @override
  String get activityThinkingAnyMoment => 'A qualquer momento';

  @override
  String get activityThinkingStillLocate => 'Ainda está a diminuir.';

  @override
  String get activityWaitingCall => 'Chamar o modelo...';

  @override
  String get activityWaitingOnWay => 'O modelo está a caminho';

  @override
  String get activityWaitingSpeak => 'À espera de uma palavra...';

  @override
  String get activityWaitingWords => 'Encontrar as palavras certas';

  @override
  String get activityWaitingAwake => 'O modelo já acordou?';

  @override
  String get activityWaitingStretch => 'Deixando-o esticar';

  @override
  String get activityWaitingYawn => 'O modelo bocejou';

  @override
  String get activityWaitingComing => 'Modelo: a caminho';

  @override
  String get activityWaitingText => 'À espera das primeiras palavras';

  @override
  String get activityWaitingQueue => 'Ainda na fila';

  @override
  String get activityWaitingBrew => 'Algo está crescendo';

  @override
  String get activityWaitingWater => 'Modelo tomando um gole';

  @override
  String get activityWaitingWarmup => 'Deixa-o aquecer';

  @override
  String get activityWaitingMeditate => 'Meditação do modelo';

  @override
  String get activityWaitingBlink => 'À espera que pisque';

  @override
  String get activityWaitingMoment => 'Diz, “um momento”';

  @override
  String get activityWritingWords => 'Encontrar as palavras';

  @override
  String get activityWritingTyping => 'Digitando';

  @override
  String get activityWritingInspired => 'Palavras que fluem como magia';

  @override
  String get activityWritingOnIt => 'Escrever, escrever';

  @override
  String get activityWritingCareful => 'Escolhendo cada palavra';

  @override
  String get activityWritingFlow => 'Tudo em um fluxo';

  @override
  String get activityWritingPlain => 'Colocando em palavras simples';

  @override
  String get activityWritingIdeas => 'Colocar ideias em palavras';

  @override
  String get activityWritingKeys => 'Tapping away';

  @override
  String get activityWritingAlmost => 'Quase terminado a escrita';

  @override
  String get activityWritingTell => 'Deixa-me dizer-te.';

  @override
  String get activityWritingFast => 'A escrever uma tempestade';

  @override
  String get activityWritingBreeze => 'Palavras que voam para a página';

  @override
  String get activityWritingFormat => 'Arrumar a disposição';

  @override
  String get activityNightAscend => '- A dormir.';

  @override
  String get activityNightHello => 'Olá um pouco tarde da noite';

  @override
  String get activityNightOwl => 'Você também é uma coruja noturna?';

  @override
  String get activityNightMoon => 'Se a lua está para cima, estou para cima';

  @override
  String get activityNightSlow => 'Cérebro tardio, vai com calma.';

  @override
  String get activityNightChampion => 'Noite coruja campeão online';

  @override
  String get activityNightSleepy => 'Dorminhoco, mas eu tenho isso';

  @override
  String get activityNightMidnight => 'Ainda passa da meia-noite.';

  @override
  String get activityNightOpen => 'Aberto para o rodada da noite';

  @override
  String get activityNightStars => 'Até as estrelas estão a dormir';

  @override
  String get activityNightDawn => 'Pensando nas pequenas horas';

  @override
  String get activityWeekendChill => 'Um pouco de frio no fim de semana';

  @override
  String get activityWeekendHere => 'Aqui nos fins de semana também!';

  @override
  String get activityWeekendCompany => 'Aqui em dias de folga também';

  @override
  String get activityWeekendOnline => 'Sem encerramento de fim de semana';

  @override
  String get activityWeekendSneak => 'Pensamento de fim de semana astuto';

  @override
  String get activityWeekendWorking => 'A trabalhar no fim-de-semana também?';

  @override
  String get activityWeekendMode => 'Modo de fim de semana ativado';

  @override
  String get activityWeekendBugs => 'Correcção de erros no fim de semana';

  @override
  String get activityWeekendSkin => 'Olhar exclusivo no fim de semana';

  @override
  String get activityNewYearCheers => 'Feliz Ano Novo!';

  @override
  String get activityNewYearDay => 'Feliz Ano Novo';

  @override
  String get activityNewYearBugs => 'Ano novo, novos erros';

  @override
  String get activityNewYearFirstLine => 'Primeira linha de código este ano';

  @override
  String get activityNewYearWork => 'Um brinde a um grande começo';

  @override
  String get activityValentineCode => 'Codificação no Dia dos Namorados também';

  @override
  String get activityValentineLove => 'Código é amor verdadeiro';

  @override
  String get activityValentineDate => 'Nenhum encontro hoje?';

  @override
  String get activityValentineKeyboard => 'Teclados são as minhas rosas';

  @override
  String get activityPiDay => 'Feliz dia π';

  @override
  String get activityPiCircle => 'Círculos extra redondos hoje';

  @override
  String get activityAprilFools => 'Feliz dia dos tolos de abril';

  @override
  String get activityAprilBug => 'Este inseto é uma brincadeira, certo?';

  @override
  String get activityAprilErrors => 'Cuidado com os erros de partida';

  @override
  String get activityAprilKidding => 'Brincadeira, sem erros.';

  @override
  String get activityLaborWorking => 'Ainda trabalhando no Dia do Trabalho';

  @override
  String get activityLaborPride => 'Um pouco de orgulho no trabalho';

  @override
  String get activityLaborSpirit => 'Modo do trabalhador: tudo em';

  @override
  String get activityChildrenDay => 'Feliz Dia das Crianças';

  @override
  String get activityChildrenHeart => 'Somos todos crianças no coração';

  @override
  String get activityChildrenCode => 'Código bonito apenas hoje';

  @override
  String get activityProgrammerCheers => 'Feliz Dia dos Programadores 1024';

  @override
  String get activityProgrammerDay => 'É o Dia dos Programadores';

  @override
  String get activityProgrammer1024 => '1024, feliz dia de codificação';

  @override
  String get activityProgrammerCode => 'Codificação nas nossas férias também';

  @override
  String get activityHalloween => 'Feliz Dia das Bruxas';

  @override
  String get activityHalloweenTreat => 'Doces ou travessuras';

  @override
  String get activityHalloweenCode => 'Código pode ser assustador também';

  @override
  String get activityChristmasEve => 'Feliz véspera de Natal';

  @override
  String get activityChristmasEveThinking => 'Pensando na véspera de Natal também';

  @override
  String get activityChristmasEveGift => 'Código esta noite, presentes aguardam';

  @override
  String get activityChristmas => 'Feliz Natal';

  @override
  String get activityChristmasCompany => 'Aqui com você para o Natal';

  @override
  String get activityChristmasEgg => 'Um ovo de Páscoa só de Natal';

  @override
  String get activityChristmasReindeer => 'Código de entrega de renas';

  @override
  String get activityYearEndEve => 'Véspera de Ano Novo';

  @override
  String get activityYearEndLast => 'Um último pensamento este ano';

  @override
  String get activityYearEndReady => 'Pronto para o novo ano';

  @override
  String get activityYearEndSeeYou => 'Até ao próximo ano!';

  @override
  String get activityZodiacRat => 'Rato';

  @override
  String get activityZodiacOx => 'Ox';

  @override
  String get activityZodiacTiger => 'Tigre';

  @override
  String get activityZodiacRabbit => 'Coelho';

  @override
  String get activityZodiacDragon => 'Dragão';

  @override
  String get activityZodiacSnake => 'Cobra';

  @override
  String get activityZodiacHorse => 'Equino';

  @override
  String get activityZodiacGoat => 'Cabra';

  @override
  String get activityZodiacMonkey => 'Macaco';

  @override
  String get activityZodiacRooster => 'Galo';

  @override
  String get activityZodiacDog => 'Cão';

  @override
  String get activityZodiacPig => 'Suínos';

  @override
  String get activityLunarCheers => 'Feliz Ano Novo Lunar!';

  @override
  String get activityLunarCode => 'Ainda codificando no Ano Novo';

  @override
  String get activityLunarEnvelope => 'envelopes vermelhos, por favor.';

  @override
  String get activityLunarSpring => 'Feliz Festival da Primavera';

  @override
  String get activityLunarGreeting => 'Saudações de Ano Novo';

  @override
  String get activityLunarCodeGreeting => 'O código diz Feliz Ano Novo';

  @override
  String get activityRareSsr => 'RCE! Ovo de Páscoa raro';

  @override
  String get activityRareUr => 'UR gota';

  @override
  String get activityRareLegend => 'Lendária queda!';

  @override
  String get activityRareOrange => 'Uma gota de laranja';

  @override
  String get activityRareEgg => 'Um ovo de Páscoa encontrou-te';

  @override
  String get activityRareChosen => 'O momento escolhido';

  @override
  String get activityRareHidden => 'Encontrou a edição oculta';

  @override
  String get activityRareChat => 'Conversa secreta desbloqueada';

  @override
  String get activityRareMax => 'Raridade MAX';

  @override
  String get activityRareLucky => 'A sorte está do seu lado';

  @override
  String get activityRareCritical => 'Hit crítico';

  @override
  String get activityRareNextLevel => 'Pensamento de nível seguinte';

  @override
  String get activityFailCrash => 'Bem, isso correu mal.';

  @override
  String get activityFailOops => 'Oops';

  @override
  String get activityFailRun => 'Isso não funcionou';

  @override
  String get activityFailTrip => 'Um pequeno tropeço';

  @override
  String get activityFailWrong => 'Isso não está certo';

  @override
  String get activityFailHiccup => 'Bater num soluço';

  @override
  String get activityFailBroken => 'Isso não está funcionando';

  @override
  String get activityFailLocal => 'Funciona na minha máquina.';

  @override
  String get activityFailYesterday => 'Funcionou ontem.';

  @override
  String get activityFailTough => 'Essa é difícil.';

  @override
  String get activityFailCrack => 'Bem, isso desmoronou.';

  @override
  String get activityFailPressure => 'Sentindo a pressão';

  @override
  String get activityFailCareless => 'Fiquei um pouco descuidado lá.';

  @override
  String get activityFailSlip => 'Um deslize das chaves';

  @override
  String get activityFailTryAgain => 'Vamos tentar outra maneira';

  @override
  String get activityFailChance => 'Dá-me outra oportunidade.';

  @override
  String get activityTestGreen => 'Todos os testes verdes';

  @override
  String get activityTestAllGreen => 'Tudo verde. Boa.';

  @override
  String get activityTestFirstTry => 'Passou a primeira tentativa!';

  @override
  String get activityTestNoErrors => 'Sem erros';

  @override
  String get activityTestPassed => 'Passou!';

  @override
  String get activityTestSolid => 'Parecendo sólido';

  @override
  String get activityTestRed => 'Vermelho. Vamos ver o que quebrou';

  @override
  String get activityTestInvestigate => 'Os testes falharam. Estou a investigar.';

  @override
  String get activityTestStubborn => 'Um teste teimoso';

  @override
  String get activityTestFix => 'Luz vermelha. Voltar à fixação';

  @override
  String get activityGitCommitSave => 'Comprometido. Progresso salvo';

  @override
  String get activityGitSaved => 'Progresso salvo';

  @override
  String get activityGitCommitRelief => 'Comprometido. Paz de espírito';

  @override
  String get activityGitPushed => 'Empurrado';

  @override
  String get activityGitPushDone => 'Empurrado. Lá vai.';

  @override
  String get activityGitCodeOut => 'Código fora da porta';

  @override
  String get activityInstallDone => 'Dependências instaladas';

  @override
  String get activityInstallInternet => 'Transferido metade da Internet';

  @override
  String get activityInstallPackages => 'Todos os pacotes presentes';

  @override
  String get activityMilestoneFive => 'Ferramentas x5, entrar nele';

  @override
  String get activityMilestoneTen => 'Combinação de ferramentas x10';

  @override
  String get activityMilestoneTwenty => 'Ferramentas x20, num rolo';

  @override
  String get activityMilestoneFifty => 'Ferramentas x50, horas extras de trabalho';

  @override
  String get activityRetryWait => 'Aguenta-te, tente novamente.';

  @override
  String get activityRetryBackoff => 'Virou-se. Recuar';

  @override
  String get activityRetryKnock => 'Batendo mais uma vez';

  @override
  String get activityRateLimited => 'Taxa limitada. A fazer uma pausa.';

  @override
  String get activityRate429 => '429. Um respirador, então tente novamente';

  @override
  String get activityRateQueue => 'Uma fila e tanto hoje';

  @override
  String get activityCompactContext => 'A arrumar o contexto...';

  @override
  String get activityCompactBag => 'Organizar a minha mochila...';

  @override
  String get activityCompactSpace => 'Arranjar espaço.';

  @override
  String get activityCompactMemory => 'Aparar a minha memória';

  @override
  String get activityCompactChats => 'Embalar chats antigos';

  @override
  String get activityReminderWater => 'Meia hora. Uma pausa de água?';

  @override
  String get activityReminderTenMinutes => 'Dez minutos. Grande tarefa';

  @override
  String get activityDiffTitle => 'Transformar alterações';

  @override
  String get activityDiffCopied => 'Patch copiado';

  @override
  String get activityDiffNoWrap => 'Não embrulhe linhas';

  @override
  String get activityDiffWrap => 'Quebrar linhas';

  @override
  String get activityDiffCopy => 'Copiar patch';

  @override
  String get activityDiffEmpty => 'Arquivo vazio, sem alterações a mostrar';

  @override
  String get activityDiffNewFile => 'Novo arquivo';

  @override
  String get activityDiffUnknownLines => 'Números de linhas desconhecidos';

  @override
  String get activityDiffCopyPath => 'Copiar o caminho';

  @override
  String get activityThinking => 'Pensar';

  @override
  String get activityReplyInterrupted => 'Responder (interrompido)';

  @override
  String get activityWaitingApproval => 'À espera da aprovação';

  @override
  String get activityWaitingAnswer => 'À espera de resposta';

  @override
  String get activityWriting => 'A escrever a resposta';

  @override
  String get activityThinkingNow => 'Pensar';

  @override
  String get activityRetrying => 'Repetição';

  @override
  String get activityCompacting => 'Contexto de compactação';

  @override
  String get activityVerbRun => 'Executar';

  @override
  String get activityVerbWrite => 'Escrever';

  @override
  String get activityVerbEdit => 'Editar';

  @override
  String get activityVerbImage => 'Ver imagem';

  @override
  String get activityVerbRead => 'Ler';

  @override
  String get activityVerbFind => 'Procurar';

  @override
  String get activityVerbSearch => 'Procurar';

  @override
  String get activityVerbWebSearch => 'Procurar na Web';

  @override
  String get activityVerbWebView => 'Ver a Web';

  @override
  String get activityVerbSubagent => 'Enviar o subagente';

  @override
  String get activityVerbTodo => 'Atualizar os itens por- fazer';

  @override
  String get activitySecretHide => 'Ocultar chave';

  @override
  String get activitySecretShow => 'Mostrar a chave';

  @override
  String get activitySlashNoMatch => 'Sem comando correspondente. Enviar como uma mensagem';

  @override
  String get activitySlashCommands => 'Comandos';

  @override
  String get activitySlashEnterArgs => 'Digite os argumentos e, em seguida, envie';

  @override
  String get activityStepTitle => 'Detalhes do passo';

  @override
  String get activityStepMissing => 'Este passo não está no histórico carregado';

  @override
  String get activityStepQuestion => 'Pergunta';

  @override
  String get activityStepSuccess => 'Sucesso';

  @override
  String get activityStepNeedsPermission => 'Necessita de permissão';

  @override
  String get activityTools => 'Ferramentas';

  @override
  String get activityStepDispatched => 'Expedido';

  @override
  String get activityStepExecution => 'Execução';

  @override
  String get activityStepLocation => 'Localização';

  @override
  String get activityStepArguments => 'Argumentos';

  @override
  String get activityStepChanges => 'Alterações';

  @override
  String get activityStepFullScreen => 'Ver tela cheia';

  @override
  String get activityStepReadContent => 'Conteúdo lido';

  @override
  String get activityStepWrittenContent => 'Conteúdo escrito';

  @override
  String get activityStepError => 'Erro';

  @override
  String get activityOutput => 'Saída';

  @override
  String get activityStepResult => 'Resultado';

  @override
  String get activityStepDeclined => 'Você recusou esta chamada de ferramenta';

  @override
  String get activityStepNoOutput => 'Sem saída';

  @override
  String get activityStepStart => 'Iniciado';

  @override
  String get activityDuration => 'Duração';

  @override
  String get activityFirstToken => 'Primeiro token';

  @override
  String get activityStepGeneration => 'Geração';

  @override
  String get activityStepSpeed => 'Velocidade';

  @override
  String get activityModel => 'Modelo';

  @override
  String get activityStepTiming => 'Calendário';

  @override
  String get activityUsage => 'Utilização';

  @override
  String get activityInput => 'Entrada';

  @override
  String get activityStepCacheHit => '  Cache atingido';

  @override
  String get activityStepCacheMiss => '  Falta o \'cache\'';

  @override
  String get activityStepCacheWrite => '  \'Cache\' escrever';

  @override
  String get activityStepReasoning => '  Fundamentação';

  @override
  String get activityStepAnswer => '  Resposta';

  @override
  String get activityStepThinking => 'Pensar';

  @override
  String get activityStepExplanation => 'Explicação';

  @override
  String get activityStepToolCalls => 'Ferramentas chamadas nesta etapa';

  @override
  String get activityStepProcessing => 'O modelo está a processar';

  @override
  String get activityApprovalAllowed => 'Autorizado';

  @override
  String get activityApprovalUnanswered => 'Nenhuma aprovação recebida';

  @override
  String get activityApprovalAnswered => 'Respondedo';

  @override
  String get activityToolRead => 'Ler';

  @override
  String get activityToolWrite => 'Escrever';

  @override
  String get activityToolCall => 'Ferramenta de chamada';

  @override
  String get activityTraceTitle => 'Trajetória de giro';

  @override
  String get activityTraceNotLoaded => 'O histórico deste rodada ainda não foi carregado';

  @override
  String get activityTraceOutputLimit => 'Limite de saída atingido';

  @override
  String get activityTraceEngineRestarted => 'Interrompido pelo motor reiniciar';

  @override
  String get activityTraceBlocked => 'Bloqueado';

  @override
  String get activityTraceHeading => 'Trajetória de giro  ';

  @override
  String get activityTraceWaiting => 'À sua espera';

  @override
  String get activityTraceNoSteps => 'Nenhum passo cronometrado neste rodada';

  @override
  String get activityUsageInputIncludesCache => 'Entrada inclui hits de cache';

  @override
  String get activityCacheHit => 'Cache atingido';

  @override
  String get activitySummaryTodo => 'Por- fazer actualizado';

  @override
  String get activityUsageBalance => 'DeepSeek balance';

  @override
  String get activityUsageContext => 'Contexto';

  @override
  String get activityUsageChat => 'Esta conversa';

  @override
  String get activityUsageAfterMessage => 'Aparece depois de enviar uma mensagem';

  @override
  String get activityUsageContextFull => 'O contexto está quase cheio. Envie /compact para compactá-lo';

  @override
  String get activitySpanZero => '0 seg';

  @override
  String get activitySpanTiny => '<0.1 seg';

  @override
  String activityTokensTenThousands(String value) {
    return '${value}K';
  }

  @override
  String activityTokensHundredMillions(String value) {
    return '${value}M';
  }

  @override
  String activityUsageContextSemantics(String percent) {
    return 'Contexto $percent usado, uso da visualização';
  }

  @override
  String activityUsageSystemTokens(String tokens) {
    return 'Sistema $tokens';
  }

  @override
  String activityUsageToolTokens(String tokens) {
    return 'Ferramentas $tokens';
  }

  @override
  String activityUsageMessageTokens(String tokens) {
    return 'Mensagens $tokens';
  }

  @override
  String activityUsageTurns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count total de voltas',
      one: '1 rodada total',
    );
    return '$_temp0';
  }

  @override
  String activityUsageCacheWriteTokens(String tokens) {
    return '\'Cache\' escrever $tokens';
  }

  @override
  String activitySummaryCommands(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rando $count comandos',
      one: 'Comando de execução 1',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryEditedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Editado $count arquivos',
      one: 'Arquivo 1 editado',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryReadFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ler $count arquivos',
      one: 'Leia 1 arquivo',
    );
    return '$_temp0';
  }

  @override
  String activitySummarySearches(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Procurado $count vezes',
      one: 'Pesquisado 1 vez',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryWeb(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usar a Web $count vezes',
      one: 'Usou a web 1 vez',
    );
    return '$_temp0';
  }

  @override
  String activitySummarySubagents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Subagentes chamados $count vezes',
      one: 'Chamado um subagente 1 vez',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Outras ferramentas: $count chamadas',
      one: 'Outras ferramentas: 1 chamada',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryTotal(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usado $count ferramentas',
      one: 'Ferramenta usada 1',
    );
    return '$_temp0';
  }

  @override
  String activityDiffBlockMarker(int index, int total) {
    return '@ @ alterar $index/$total @@';
  }

  @override
  String activityDiffEditMarker(int index, int total) {
    return 'Editar $index de $total';
  }

  @override
  String activityTraceSpanSemantics(String title, String detail, String duration) {
    return '$title $detail, duração $duration';
  }

  @override
  String activityTraceGroupSemantics(String label, String duration) {
    return '$label, duração $duration';
  }

  @override
  String activityTraceEstimatedCost(String cost) {
    return '$cost (estimada a taxas oficiais)';
  }

  @override
  String activityTraceReasoningTokens(String tokens) {
    return 'Fundamentação: $tokens';
  }

  @override
  String activityStepPosition(int turn, Object step) {
    return 'Virar $turn · Passo $step';
  }

  @override
  String activityStepTokenSpeed(String speed) {
    return '$speed tokens/s';
  }

  @override
  String activityStepRetryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count vezes', one: '1 vez');
    return '$_temp0';
  }

  @override
  String activityStepTruncated(String text, int count) {
    return '$text\n... (Mostrando apenas o primeiro ${count}caracteres k. Copiar para o texto completo)';
  }

  @override
  String activityStepLiveElapsed(String elapsed, String suffix) {
    return '$elapsed · Em progresso$suffix';
  }

  @override
  String activityStepCopySection(String title) {
    return 'Copiar $title';
  }

  @override
  String activityStepCopiedSection(String title) {
    return 'Copiado $title';
  }

  @override
  String activitySlashDescriptionArgs(String description) {
    return '$description · Digite argumentos, em seguida, envie';
  }

  @override
  String activitySpanSecondsText(String seconds) {
    return '$seconds seg';
  }

  @override
  String activitySpanSeconds(int seconds) {
    return '$seconds seg';
  }

  @override
  String activitySpanMinutesSeconds(int minutes, String seconds) {
    return '$minutes min $seconds seg';
  }

  @override
  String activitySpanHoursMinutes(int hours, String minutes) {
    return '$hours h $minutes min';
  }

  @override
  String activityCostUnderCent(String symbol) {
    return 'Embaixo ${symbol}0.01';
  }

  @override
  String activityCostApprox(String symbol, String amount) {
    return '≈ $symbol$amount';
  }

  @override
  String activitySpanRetries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Repetido $count vezes',
      one: 'Repetido 1 vez',
    );
    return '$_temp0';
  }

  @override
  String activitySpanToolCalls(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Escolheu ligar $count ferramentas',
      one: 'Escolheu chamar 1 ferramenta',
    );
    return '$_temp0';
  }

  @override
  String activityRunningItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'entre $count itens', one: 'entre 1 item');
    return '$_temp0';
  }

  @override
  String activityRetryAttempt(int count) {
    return 'Tentativa $count';
  }

  @override
  String activityDiffFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count arquivos', one: '1 arquivo');
    return '$_temp0';
  }

  @override
  String activityDiffFileSemantics(String path, int added, int removed) {
    String _temp0 = intl.Intl.pluralLogic(
      added,
      locale: localeName,
      other: '$added linhas adicionadas',
      one: '1 linha adicionada',
    );
    String _temp1 = intl.Intl.pluralLogic(
      removed,
      locale: localeName,
      other: '$removed linhas removidas',
      one: '1 linha removida',
    );
    return '$path, $_temp0, $_temp1';
  }

  @override
  String activityDiffEditNumber(int edit) {
    return 'Editar $edit';
  }

  @override
  String activityDiffHunkNumber(int index) {
    return 'Alterar $index';
  }

  @override
  String activityDiffFromLine(int line) {
    return 'Da linha $line';
  }

  @override
  String activityDiffEditCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Editado $count vezes',
      one: 'Editado 1 vez',
    );
    return '$_temp0';
  }

  @override
  String activityLunarZodiac(String animal) {
    return 'Boa sorte no Ano do $animal';
  }

  @override
  String activityReminderHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours horas seguidas. Fazer uma pausa?',
      one: 'Uma hora seguida. Fazer uma pausa?',
    );
    return '$_temp0';
  }

  @override
  String get activityStepModelRequest => 'Um pedido de modelo';

  @override
  String activityStepModelRequestDetail(String detail) {
    return 'Um pedido de modelo · $detail';
  }

  @override
  String activityUsageEstimatedCost(String symbol, String amount) {
    return '≈ $symbol$amount';
  }

  @override
  String activitySlashCommandSemantics(String label, String name) {
    return '$label, /$name';
  }

  @override
  String get activityToolListSeparator => ', ';

  @override
  String get botsFolderGone => 'Esta pasta desapareceu';

  @override
  String get botsFolderReadFailed => 'Não foi possível ler esta pasta';

  @override
  String get botsFolderOpenFailed => 'Não foi possível abrir esta pasta';

  @override
  String botsFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count pastas', one: '1 pasta');
    return '$_temp0';
  }

  @override
  String get botsWorkingFolder => 'Pasta de trabalho';

  @override
  String get botsFolderTeamDefault => 'Espaço de trabalho em equipa';

  @override
  String get botsFolderRoomDefault => 'O próprio diretório de cada Bot';

  @override
  String get botsFolderHint => 'Pastas na máquina conectada.';

  @override
  String get botsFolderCurrent => 'Pasta actual';

  @override
  String get botsFolderUnavailable => 'A conexão ou pasta mudou. Reabrir para continuar.';

  @override
  String get botsFolderNoChoices => 'Não existem outras pastas na máquina.';

  @override
  String get botsFolderConfirm => 'Usar esta pasta de trabalho?';

  @override
  String get botsFolderRefused =>
      'A máquina recusou esta pasta. Pode ter desaparecido, inacessível ou protegido. Escolha outro ou tente novamente.';

  @override
  String botsChildCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Agentes infantis',
      one: '1 agente infantil',
    );
    return '$_temp0';
  }

  @override
  String get botsCurrentChat => 'Conversa atual';

  @override
  String botsSubagentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count subagentes', one: '1 subagente');
    return '$_temp0';
  }

  @override
  String botsRunningCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count em execução', one: '1 execução');
    return '$_temp0';
  }

  @override
  String botsFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count falhou', one: '1 falhou');
    return '$_temp0';
  }

  @override
  String botsNestedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Inclui $count Agentes infantis',
      one: 'Inclui 1 agente infantil',
    );
    return '$_temp0';
  }

  @override
  String botsBackToParent(String title) {
    return 'Voltar para “$title”';
  }

  @override
  String botsTeamMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Equipa agente, $count membros',
      one: 'Equipa agente, 1 membro',
    );
    return '$_temp0';
  }

  @override
  String get botsAgentTeam => 'Equipa de agentes';

  @override
  String botsSubagentRunningCount(int count, int running) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count subagentes', one: '1 subagente');
    String _temp1 = intl.Intl.pluralLogic(
      running,
      locale: localeName,
      other: '$running em execução',
      one: '1 execução',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get botsSubagents => 'Subagentes';

  @override
  String get botsNoSubagents => 'Nenhum subagente enviado';

  @override
  String get botsOpenChatFirst => 'Abrir uma conversa primeiro';

  @override
  String get botsTeamReadFailed => 'Não foi possível carregar a equipe';

  @override
  String get botsNoTeamOnHost => 'Nenhuma equipa de agentes nesta máquina';

  @override
  String get botsTeamNotEnabled => 'A equipa de agentes está fora.';

  @override
  String get botsTeamDescription => 'Agentes trabalham em conjunto em um quadro de tarefas compartilhado';

  @override
  String get botsTeamEnabling => 'Ativando…';

  @override
  String get botsTeamEnable => 'Ligar a equipa';

  @override
  String botsMembersWorking(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membros que trabalham',
      one: '1 membro que trabalha',
    );
    return '$_temp0';
  }

  @override
  String get botsTeamStandby => 'Todos em espera';

  @override
  String get botsMembers => 'Membros';

  @override
  String get botsTasks => 'Tarefas';

  @override
  String get botsTeamRecordUnreadable => 'Não foi possível ler um registro de equipe';

  @override
  String get botsMessages => 'Mensagens';

  @override
  String get botsOwner => 'Dono';

  @override
  String get botsTeamCreateHint => 'Peça à IA para formar uma equipe em um bate-papo';

  @override
  String get botsCurrent => 'Atual';

  @override
  String get botsNoTasks => 'Sem tarefas ainda';

  @override
  String get botsTodo => 'Para fazer';

  @override
  String get botsUnassigned => 'Não atribuído';

  @override
  String botsTaskWaitingFor(String dependencies) {
    return 'À espera $dependencies';
  }

  @override
  String get botsWriteOverlap => 'Sobreposição de escopos de escrita';

  @override
  String get botsWaitingDependencies => 'À espera de dependências';

  @override
  String get botsReadyToStart => 'Pronto para iniciar';

  @override
  String get botsTaskId => 'ID';

  @override
  String get botsDependencies => 'Dependência';

  @override
  String get botsWriteScopes => 'Gravar os escopos';

  @override
  String get botsMessagesReadFailed => 'Não foi possível carregar as mensagens';

  @override
  String get botsNoMemberMessages => 'Nenhuma mensagem entre membros ainda';

  @override
  String get botsMessagesIncomplete => 'As mensagens de alguns membros não carregaram · Repetir';

  @override
  String botsDateTime(String date, String time) {
    return '$date $time';
  }

  @override
  String get botsViewDetails => 'Ver detalhes';

  @override
  String get botsAdmin => 'Administrador';

  @override
  String get botsFullTextChanged => 'Esta conversa mudou';

  @override
  String get botsFullTextReopen => 'Abrir a mensagem novamente';

  @override
  String get botsFullTextReadFailed => 'Não foi possível carregar o texto completo';

  @override
  String get botsShowAll => 'Mostrar tudo';

  @override
  String get botsImagePlaceholder => '[Imagem]';

  @override
  String get botsSending => 'Enviando';

  @override
  String get botsWriteOwn => 'Escreva o seu próprio';

  @override
  String get botsSubmit => 'Enviar';

  @override
  String botsChooseModelFor(String name) {
    return 'Escolha um modelo para $name';
  }

  @override
  String get botsModelGreeting => 'Ele vai dizer olá uma vez que você escolher';

  @override
  String get botsChooseModel => 'Escolher modelo';

  @override
  String get botsSkipAnswer => 'Pular';

  @override
  String get botsBotGone => 'Este robô desapareceu.';

  @override
  String get botsWaitingModel => 'Escolha um modelo';

  @override
  String get botsThinking => 'Pensar';

  @override
  String get botsMainBot => 'Botão principal';

  @override
  String get botsIdle => 'Idle';

  @override
  String get botsAnsweredQuestion => 'Você respondeu à pergunta.';

  @override
  String get botsEarlierMessages => 'Mensagens anteriores';

  @override
  String botsComposerHint(String name) {
    return 'Mensagem $name…';
  }

  @override
  String botsDeleteNamed(String name) {
    return 'Apagar “$name”?';
  }

  @override
  String get botsDeleteBotBody => 'As conversas ficam. As suas memórias vão para o arquivo.';

  @override
  String get botsTokensToday => '24h fichas';

  @override
  String get botsMemoryUnit => 'Memórias';

  @override
  String get botsRoomUnit => 'Conversas de grupo';

  @override
  String get botsProfile => 'Perfil';

  @override
  String get botsModel => 'Modelo';

  @override
  String get botsBotName => 'Nome';

  @override
  String get botsRole => 'Papel';

  @override
  String get botsWriterExample => 'Por exemplo: hunger';

  @override
  String get botsInstructions => 'Instruções';

  @override
  String get botsInstructionsHint => 'Como deve funcionar';

  @override
  String get botsColor => 'Cor';

  @override
  String get botsUsage => 'Utilização';

  @override
  String get botsUsageScanning => 'Ainda estou a contar conversas antigas. Os totais vão preencher.';

  @override
  String get botsUsageRefresh => 'Atualizar';

  @override
  String get botsToday => 'Últimas 24 horas';

  @override
  String get botsLastWeek => 'Últimos 7 dias';

  @override
  String get botsLastMonth => 'Últimos 30 dias';

  @override
  String botsMonthCalls(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Últimos 30 dias · $count chamadas',
      one: 'Últimos 30 dias · 1 chamada',
    );
    return '$_temp0';
  }

  @override
  String get botsFullRecord => 'Registo completo';

  @override
  String get botsEveryToolCall => 'Cada chamada de ferramentas';

  @override
  String get botsUnsetMain => 'Desactivar o bot principal';

  @override
  String get botsSetMain => 'Definir como principal';

  @override
  String get botsDeleteBot => 'Apagar bot';

  @override
  String get botsEffortOff => 'Sem pensar.';

  @override
  String get botsEffortMinimal => 'Mínimo';

  @override
  String get botsEffortLow => 'Baixo';

  @override
  String get botsEffortMedium => 'Médio';

  @override
  String get botsEffortHigh => 'Alta';

  @override
  String get botsEffortMax => 'Máxima';

  @override
  String botsNamedRecord(String name) {
    return '$name · Registro completo';
  }

  @override
  String get botsOrganizingNotes => 'Notas de organização';

  @override
  String get botsToolRun => 'executar comandos';

  @override
  String get botsToolRead => 'view files';

  @override
  String get botsToolEdit => 'editar arquivos';

  @override
  String get botsToolSearch => 'pesquisar na web';

  @override
  String get botsToolBrowse => 'navegar na web';

  @override
  String get botsToolMessage => 'contactar outros bots';

  @override
  String get botsToolGroup => 'chat com o grupo';

  @override
  String get botsToolMemory => 'organizar memórias';

  @override
  String get botsToolRecall => 'olhar através de registros';

  @override
  String get botsToolTeam => 'organizar a equipe';

  @override
  String get botsToolAsk => 'perguntar-te uma coisa.';

  @override
  String get botsToolWork => 'trabalho';

  @override
  String get botsJustNow => 'Agora mesmo.';

  @override
  String botsCountHundredMillion(String value) {
    return '${value}M';
  }

  @override
  String botsCountTenThousand(String value) {
    return '${value}K';
  }

  @override
  String get botsModelNotSelected => 'Não selecionado';

  @override
  String botsYourPreview(String preview) {
    return 'Você: $preview';
  }

  @override
  String botsEventWorking(String name) {
    return '$name começou a trabalhar';
  }

  @override
  String botsEventApproval(String name) {
    return '$name precisa da sua aprovação';
  }

  @override
  String botsEventDone(String name) {
    return '$name terminou o trabalho';
  }

  @override
  String botsEventStopped(String name) {
    return 'Tu paraste. ${name}A obra';
  }

  @override
  String botsEventFailed(String name) {
    return '$name não podia responder';
  }

  @override
  String botsEventMissed(String name) {
    return '$name não respondeu a tempo';
  }

  @override
  String botsEventLookup(String name) {
    return '$name olhou através de suas conversas';
  }

  @override
  String botsEventLookupQuery(String name, String query) {
    return '$name procurou seus bate-papos para “$query”';
  }

  @override
  String botsEventResumed(String name) {
    return '$name retomado após reiniciar';
  }

  @override
  String botsEventCut(String name) {
    return '$name parou após outra reinicialização interrompida';
  }

  @override
  String get botsAutomation => 'Automação';

  @override
  String botsAutomationText(String text) {
    return 'Automação: $text';
  }

  @override
  String get botsOtherBot => 'Outro bot';

  @override
  String botsMessageFrom(String name) {
    return 'Mensagem de $name';
  }

  @override
  String botsEventReplied(String name) {
    return '$name respondido';
  }

  @override
  String get botsGroupReplied => 'Uma resposta no grupo';

  @override
  String botsNamedGroupReplied(String name) {
    return 'Uma resposta em “$name”';
  }

  @override
  String botsEventCalledStop(String name) {
    return '$name parou o trabalho';
  }

  @override
  String get botsChooseMember => 'Escolher membro';

  @override
  String get botsMentionMember => 'Membro da lista';

  @override
  String get botsRelayUnavailable => 'Bots não estão disponíveis sobre Relay';

  @override
  String get botsUseSsh => 'Conecte-se a este computador sobre o SSH para usar bots';

  @override
  String get botsTeamLoadFailed => 'Não foi possível carregar a equipe bot';

  @override
  String botsBotCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count bots', one: '1 bot');
    return '$_temp0';
  }

  @override
  String botsRoomCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chats em grupo',
      one: '1 conversa em grupo',
    );
    return '$_temp0';
  }

  @override
  String get botsNewBot => 'Novo bot';

  @override
  String get botsGroupChat => 'Conversa de grupo';

  @override
  String get botsNewGroup => 'Novo grupo';

  @override
  String get botsDuplicateCreated => 'Entendido. Vai aparecer na lista em breve.';

  @override
  String get botsDuplicate => 'Bot duplicado';

  @override
  String get botsDuplicateHint => 'As mesmas configurações, chat fresco e memória';

  @override
  String botsDuplicateNamed(String name) {
    return 'Duplicar $name?';
  }

  @override
  String get botsDuplicateBody =>
      'O novo Bot mantém seu trabalho, instruções e configurações de modelo, começa com um novo bate-papo e memória pessoal, e recebe seu nome do host. Quando um modelo está disponível, ele começa com uma saudação.';

  @override
  String get botsChooseModelStart => 'Escolha um modelo para iniciar';

  @override
  String get botsNoChats => 'Sem conversas ainda';

  @override
  String botsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count não lido', one: '1 não lido');
    return '$_temp0';
  }

  @override
  String get botsMainTag => 'Principal';

  @override
  String get botsMemberNeedsApproval => 'Um membro precisa de aprovação';

  @override
  String botsNamedWorking(String name) {
    return '$name está funcionando';
  }

  @override
  String botsNamesWorking(String names) {
    return '$names estão funcionando';
  }

  @override
  String botsMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count membros', one: '1 membro');
    return '$_temp0';
  }

  @override
  String get botsUpdateRequired => 'DS Bot precisa de uma atualização';

  @override
  String get botsInstall => 'Instalar o DS Bot';

  @override
  String get botsUpdateForPhone => 'Atualizar para usá-lo no telefone';

  @override
  String get botsInstallDescription => 'Bots sempre ligados, cada um com sua própria memória e papel';

  @override
  String botsInstallOnHost(String host) {
    return 'Instalar em $host para começar';
  }

  @override
  String botsRunsOnHost(String host) {
    return 'Continua $host';
  }

  @override
  String get botsInstalling => 'Instalar';

  @override
  String get botsMemory => 'Memória';

  @override
  String get botsEditMemory => 'Editar memória';

  @override
  String get botsAddMemory => 'Adicionar memória';

  @override
  String get botsMemoryReplyExample => 'Por exemplo: Requests short';

  @override
  String get botsMemoryDraftExample => 'Por exemplo: medicine';

  @override
  String botsMemoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Memória · $count', one: 'Memória · 1');
    return '$_temp0';
  }

  @override
  String get botsMemoryReadFailed => 'Não foi possível carregar memórias';

  @override
  String get botsSummary => 'Resumo';

  @override
  String get botsNoMemory => 'Sem memórias ainda';

  @override
  String get botsTeam => 'Equipa';

  @override
  String get botsSelf => 'Auto';

  @override
  String get botsWrittenByYou => 'Escrito por você';

  @override
  String get botsNameRequired => 'Digite um nome';

  @override
  String get botsRoleHint => 'O que faz, numa frase';

  @override
  String get botsNewInstructionsHint => 'Como deve funcionar e o que ter em mente';

  @override
  String get botsAppearance => 'Aparência';

  @override
  String get botsCreating => 'Criando';

  @override
  String get botsGroupNameOptional => 'Nome do grupo (opcional)';

  @override
  String botsMembersSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Membros · $count selecionado',
      one: 'Membros · 1 selecionados',
    );
    return '$_temp0';
  }

  @override
  String get botsPickTwoBots => 'Escolha pelo menos dois bots';

  @override
  String get botsFullText => 'Texto completo';

  @override
  String botsTextPartial(String count) {
    return 'Mostrando o primeiro $count caracteres';
  }

  @override
  String get botsTextCompletenessUnknown => 'Não foi possível confirmar este é o texto completo';

  @override
  String get botsRoomGone => 'Esta conversa de grupo desapareceu';

  @override
  String botsNamedSpeaking(String name) {
    return '$name está falando';
  }

  @override
  String botsNamedActivity(String name, String activity) {
    return '$name: $activity';
  }

  @override
  String get botsWorking => 'A trabalhar';

  @override
  String get botsDiscussing => 'Discutindo';

  @override
  String get botsTyping => 'Dactilografia';

  @override
  String get botsGroupComposerHint => 'Mensagem a todos...';

  @override
  String get botsDecline => 'Recusar';

  @override
  String get botsAllowOnce => 'Permitir uma vez';

  @override
  String get botsPrivateChat => 'Conversar em privado';

  @override
  String get botsSetAdmin => 'Make admin';

  @override
  String get botsRemoveMember => 'Remover do grupo';

  @override
  String get botsDeleteRoomBody => 'Os registros do grupo permanecem. As suas memórias vão para o arquivo.';

  @override
  String botsNamedAdmin(String name) {
    return 'Administrador $name';
  }

  @override
  String botsRoomWorkingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count trabalhando', one: '1 trabalhando');
    return '$_temp0';
  }

  @override
  String botsMembersCountTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Membros · $count', one: 'Membros · 1');
    return '$_temp0';
  }

  @override
  String get botsStopMember => 'Parar';

  @override
  String get botsAddMember => 'Adicionar membros';

  @override
  String get botsWhoAnswers => 'Quem responde primeiro';

  @override
  String get botsAdminFirst => 'Administrar primeiro';

  @override
  String get botsEveryoneInTurn => 'Revezar';

  @override
  String get botsGroupName => 'Nome do grupo';

  @override
  String get botsGroupNotice => 'Aviso de grupo';

  @override
  String get botsGroupNoticeHint => 'Cada membro vê isso antes de falar';

  @override
  String get botsDeleteGroup => 'Excluir grupo';

  @override
  String get botsDiscardTitle => 'Descartar as alterações?';

  @override
  String get botsKeepEditing => 'Continuar a editar';

  @override
  String get botsDiscard => 'Descartar';

  @override
  String get botsProgress => 'Progresso';

  @override
  String get botsGlyphRun => 'Executar';

  @override
  String get botsGlyphJobOutput => 'Listar as tarefas de fundo';

  @override
  String get botsGlyphJobs => 'Trabalhos de base';

  @override
  String get botsGlyphStopJob => 'Parar a tarefa de fundo';

  @override
  String get botsGlyphRead => 'Ler';

  @override
  String get botsGlyphImage => 'Ver imagem';

  @override
  String get botsGlyphDeliver => 'Apresentar arquivos';

  @override
  String get botsGlyphWrite => 'Escrever';

  @override
  String get botsGlyphSearch => 'Procurar';

  @override
  String get botsGlyphFindFiles => 'Procurar arquivos';

  @override
  String get botsGlyphOpenWeb => 'Abrir página web';

  @override
  String get botsGlyphMessageAgent => 'Subagente da mensagem';

  @override
  String get botsGlyphInterruptAgent => 'Interromper o subagente';

  @override
  String get botsGlyphListModels => 'Listar modelos de subagentes';

  @override
  String get botsGlyphWorkflow => 'Fluxo de trabalho';

  @override
  String get botsGlyphLoop => 'Tarefa de circuito';

  @override
  String get botsGlyphSkill => 'Usar habilidade';

  @override
  String get botsGlyphTodo => 'Atualizar os itens por- fazer';

  @override
  String get botsGlyphSetGoal => 'Definir o objetivo';

  @override
  String get botsGlyphViewGoal => 'Objetivo da visão';

  @override
  String get botsGlyphUpdateGoal => 'Atualizar o objectivo';

  @override
  String get botsGlyphAsk => 'Colocar questão';

  @override
  String get botsCommunityEmpty => 'Ainda nada aqui.';

  @override
  String get botsCommunityGroups => 'Grupos de conversação';

  @override
  String get botsCommunity => 'Comunidade';

  @override
  String get botsForum => 'Fórum';

  @override
  String get botsForumSubtitle => 'Perguntar, compartilhar, conectar';

  @override
  String get botsProjectHome => 'DSH Go para casa do projeto';

  @override
  String get botsOpenSource => 'Projeto de código aberto';

  @override
  String get botsPluginCatalogFailed => 'Não foi possível abrir o catálogo de plugins';

  @override
  String get botsTapRetry => 'Toque em para repetir';

  @override
  String get botsFeaturedPlugins => 'Plug-ins em destaque';

  @override
  String get botsPluginSource => 'Informações do plug-in do dshfind';

  @override
  String get botsPromptIdeas => 'Experimenta isto.';

  @override
  String get botsUpdates => 'Novidades';

  @override
  String get botsLink => 'link';

  @override
  String botsLinkOpenFailed(String host) {
    return 'Não foi possível abrir $host';
  }

  @override
  String botsYearMonth(int year, String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Fev',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'Maio',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Out',
      '11': 'Nov',
      '12': 'Dez',
      'other': '$month',
    });
    return '$_temp0 $year';
  }

  @override
  String get botsCopyGroupNumber => 'Copiar o número do grupo';

  @override
  String botsQrCodeLabel(String title) {
    return '$title Código QR';
  }

  @override
  String get botsFiles => 'Arquivos';

  @override
  String get botsEmptyCell => '(vazio)';

  @override
  String botsYesterdayTime(String time) {
    return 'Ontem $time';
  }

  @override
  String get botsOutsideWorkspace => 'Fora do espaço de trabalho';

  @override
  String get botsNotFolder => 'Isto não é uma pasta';

  @override
  String get botsChatNotFound => 'Chat não encontrado';

  @override
  String get botsBrowseUnsupported => 'Esta conexão não suporta a navegação de arquivos';

  @override
  String get botsWorkspace => 'Espaço de trabalho';

  @override
  String get botsSearchFiles => 'Procurar arquivos';

  @override
  String get botsGoUp => 'Sobe.';

  @override
  String get botsEmptyFolder => 'Pasta vazia';

  @override
  String botsFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count arquivos', one: '1 arquivo');
    return '$_temp0';
  }

  @override
  String botsTruncatedItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Apenas o primeiro $count os itens são mostrados',
      one: 'Apenas o primeiro item é mostrado',
    );
    return '$_temp0';
  }

  @override
  String get botsMoreActions => 'Mais ações';

  @override
  String get botsSearchFailed => 'Não foi possível pesquisar';

  @override
  String get botsNoResults => 'Sem resultados';

  @override
  String get botsCopyPath => 'Copiar o caminho';

  @override
  String get botsPetOutsideApp => 'Mostrar fora da aplicativo';

  @override
  String get botsPetNotAuthorized => 'Não permitido';

  @override
  String get botsPetDisplayWhen => 'Quando mostrar';

  @override
  String get botsPetWhenActive => 'Quando ativo';

  @override
  String get botsPetAlways => 'Sempre';

  @override
  String get botsPetSwitchDisabled => 'Mudar para desactivada';

  @override
  String get botsPetRestrictedSettings => 'Permitir configurações restritas';

  @override
  String get botsPetHiddenToday => 'Escondido por hoje';

  @override
  String get botsPetRestore => 'Restaurar';

  @override
  String get botsPetChange => 'Mudar o animal de estimação';

  @override
  String get botsPetHideHour => 'Esconder durante 1 hora';

  @override
  String get botsPetSettings => 'Configuração do Pet';

  @override
  String get botsPetDeepy => 'Deepy';

  @override
  String get botsPetWhaleGirl => 'Baleia';

  @override
  String get botsPetNone => 'Nenhum';

  @override
  String get botsPets => 'Mascotes';

  @override
  String get botsPetSource => 'De DSH-TUI';

  @override
  String get botsPetSize => 'Tamanho';

  @override
  String get botsPetQuiet => 'Modo silencioso';

  @override
  String get botsPetQuietSubtitle => 'Apenas animações, sem bolhas';

  @override
  String get botsPetShowNow => 'Mostrar agora';

  @override
  String botsPetHiddenUntil(String time) {
    return 'Escondido até $time';
  }

  @override
  String get botsKeyEsc => 'Enviar Esc';

  @override
  String get botsKeyTab => 'Enviar aba';

  @override
  String get botsKeyLeft => 'Esquerda';

  @override
  String get botsKeyUp => 'Subir';

  @override
  String get botsKeyDown => 'Descer';

  @override
  String get botsKeyRight => 'Direita';

  @override
  String get botsKeyPipe => 'Tubulação';

  @override
  String get botsKeyTilde => 'Tilde';

  @override
  String get botsKeySlash => 'Slash';

  @override
  String get botsKeyDash => 'Hífen';

  @override
  String get botsTerminal => 'Terminal';

  @override
  String get botsTerminalRename => 'Renomear terminal';

  @override
  String get botsTerminalName => 'Nome do terminal';

  @override
  String get botsTerminalRenameFailed => 'Não foi possível renomear';

  @override
  String botsTerminalCloseNamed(String title) {
    return 'Fechar “$title”?';
  }

  @override
  String get botsTerminalCloseBody => 'Os processos internos terminarão';

  @override
  String get botsTerminalUnsupported => 'Terminal não está disponível nesta conexão';

  @override
  String get botsTerminalSupportedHosts => 'Disponível neste celular ou numa máquina SSH';

  @override
  String get botsTerminalOpening => 'Abrindo terminal...';

  @override
  String get botsTerminalNone => 'Sem terminais abertos';

  @override
  String get botsTerminalNew => 'Novo terminal';

  @override
  String get botsTerminalClose => 'Fechar terminal';

  @override
  String get botsTerminalChooseShell => 'Escolher shell';

  @override
  String get botsTerminalShellFailed => 'Não foi possível carregar shells';

  @override
  String get botsTerminalReading => 'A ler...';

  @override
  String get botsTerminalDefaultShell => 'Consola padrão';

  @override
  String get botsTerminalOtherDevice => 'Outro dispositivo está digitando';

  @override
  String get botsTerminalTakeOver => 'Assuma o comando.';

  @override
  String get botsTerminalStarting => 'A começar...';

  @override
  String get botsTerminalConnecting => 'Conectando...';

  @override
  String get botsTerminalDisconnected => 'Desligado';

  @override
  String get botsTerminalReconnect => 'Religar';

  @override
  String get botsTerminalEnded => 'Terminado';

  @override
  String botsTerminalExitCode(int code) {
    return 'Terminado · Código de saída $code';
  }

  @override
  String get botsTerminalGone => 'Este terminal desapareceu.';

  @override
  String get botsTerminalLimit => 'Fechar primeiro os terminais não utilizados';

  @override
  String get botsToolWorkingRun => 'Comandos em execução';

  @override
  String botsToolApprovalRun(String name) {
    return '$name deseja executar comandos';
  }

  @override
  String get botsToolWorkingRead => 'Visualizando arquivos';

  @override
  String botsToolApprovalRead(String name) {
    return '$name deseja visualizar arquivos';
  }

  @override
  String get botsToolWorkingEdit => 'Editando arquivos';

  @override
  String botsToolApprovalEdit(String name) {
    return '$name deseja editar arquivos';
  }

  @override
  String get botsToolWorkingSearch => 'Pesquisando na web';

  @override
  String botsToolApprovalSearch(String name) {
    return '$name quer pesquisar na web';
  }

  @override
  String get botsToolWorkingBrowse => 'Navegação na Web';

  @override
  String botsToolApprovalBrowse(String name) {
    return '$name quer navegar na web';
  }

  @override
  String get botsToolWorkingMessage => 'Contacto com outros bots';

  @override
  String botsToolApprovalMessage(String name) {
    return '$name quer contactar outros bots';
  }

  @override
  String get botsToolWorkingGroup => 'Conversar com o grupo';

  @override
  String botsToolApprovalGroup(String name) {
    return '$name quer conversar com o grupo';
  }

  @override
  String get botsToolWorkingMemory => 'Organizar memórias';

  @override
  String botsToolApprovalMemory(String name) {
    return '$name quer organizar memórias';
  }

  @override
  String get botsToolWorkingRecall => 'Examinando os registros';

  @override
  String botsToolApprovalRecall(String name) {
    return '$name quer olhar através de registros';
  }

  @override
  String get botsToolWorkingTeam => 'Organizar a equipa';

  @override
  String botsToolApprovalTeam(String name) {
    return '$name quer organizar a equipe';
  }

  @override
  String get botsToolWorkingAsk => 'Preparando-se para lhe perguntar';

  @override
  String botsToolApprovalAsk(String name) {
    return '$name quer perguntar-te uma coisa.';
  }

  @override
  String get botsToolWorkingWork => 'A trabalhar';

  @override
  String botsToolApprovalWork(String name) {
    return '$name quer trabalhar';
  }

  @override
  String get botsEveryone => 'Todos.';

  @override
  String get botsActivelyRunning => 'Em execução';

  @override
  String get botsListSeparator => ', ';

  @override
  String get botsNameSeparator => ', ';

  @override
  String get botsGlyphSubagent => 'Subagente';

  @override
  String get botsGlyphWebSearch => 'Pesquisa Web';

  @override
  String botsSenderPreview(String name, String preview) {
    return '$name: $preview';
  }

  @override
  String botsAgentSemantics(String title, String state) {
    return '$title, $state';
  }

  @override
  String botsViewMetric(Object label, Object value) {
    return '$label: $value';
  }

  @override
  String get botsEffortXhigh => 'Extra alta';

  @override
  String get botsRelayLimit => 'Limite do relé de bots';

  @override
  String get botsRelayLimitHint =>
      'Pausa depois de tantas chamadas Bot-to-Bot desde a sua última mensagem. Digite um número inteiro de 1 a 200, ou deixe em branco para o padrão.';

  @override
  String botsRelayLimitDefault(int count) {
    return 'Predefinição: $count';
  }

  @override
  String get botsRelayLimitInvalid => 'Digite um número inteiro de 1 a 200.';

  @override
  String get botsRelayLimitRestore => 'Restaurar padrão';

  @override
  String get botsRelayLimitConnectionChanged => 'A ligação mudou. Fecha esta folha e abre-a outra vez.';

  @override
  String get botsMobileUnsupportedTitle => 'DS Bot ainda não está no celular';

  @override
  String get botsMobileApiRequired => 'Use-o na Web DSH por enquanto';

  @override
  String get botsMobileApiMissing => 'Ainda não está no celular. Use-o na Web DSH por enquanto';

  @override
  String get botsCreationConnectionChanged => 'A ligação mudou. Reabrir este formulário para criar na máquina atual.';

  @override
  String get brandXiaomi => 'Xiaomi / Redmi';

  @override
  String get brandHuawei => 'Huawei';

  @override
  String get brandHonor => 'Honra';

  @override
  String get brandOppo => 'OPPO / OnePlus / realme';

  @override
  String get brandSamsung => 'Samsung';

  @override
  String get brandVivoOs => 'vivo / iQOO (OriginOS)';

  @override
  String get brandXiaomiOs => 'Xiaomi / Redmi (HyperOS, MIUI)';

  @override
  String get brandHuaweiOs => 'Huawei / Honor (HarmonyOS, MagicOS)';

  @override
  String get brandOppoOs => 'OPPO / OnePlus / realme (ColorOS)';

  @override
  String get brandSamsungOs => 'Samsung (Uma UI)';

  @override
  String get brandZhihu => 'Zhihu';

  @override
  String get catalogCurrentChat => 'Conversa atual';

  @override
  String get catalogChatDetails => 'Detalhes do chat';

  @override
  String get catalogChatDetailsSummary => 'Trajetória, alterações e progresso';

  @override
  String get catalogArtifacts => 'Arquivos de saída';

  @override
  String get catalogArtifactsSummary => 'Visualizar, compartilhar e salvar';

  @override
  String get catalogFiles => 'Arquivos';

  @override
  String get catalogFilesSummary => 'Navegar e antever';

  @override
  String get catalogTerminal => 'Terminal';

  @override
  String get catalogTerminalSummary => 'Terminal de espaço de trabalho';

  @override
  String get catalogExport => 'Exportar o registo de conversas';

  @override
  String get catalogExportSummary => 'Gravar como ZIP';

  @override
  String get catalogJobs => 'Trabalhos de base';

  @override
  String get catalogJobsSummary => 'Ver os trabalhos de saída ou de paragem';

  @override
  String get catalogPlanGoal => 'Plano e objectivo';

  @override
  String get catalogPlanGoalSummary => 'Objectivos, planos e tarefas';

  @override
  String get catalogSkills => 'Habilidades';

  @override
  String get catalogSkillsSummary => 'Usar habilidades em chats';

  @override
  String get catalogSubagents => 'Subagentes';

  @override
  String get catalogSubagentsSummary => 'Lineagem e estado; toque rapidamente no chat';

  @override
  String get catalogReference => 'Arquivos de referência e chats';

  @override
  String get catalogReferenceSummary => 'Usar @ no compositor';

  @override
  String get catalogAutomationSection => 'Automação';

  @override
  String get catalogSchedules => 'Automação';

  @override
  String get catalogSchedulesSummary => 'Tarefas agendadas e recorrentes';

  @override
  String get catalogAgentModelsSection => 'Agentes e modelos';

  @override
  String get catalogPermission => 'Permissões';

  @override
  String get catalogPermissionSummary => 'Escolha quando pedir a aprovação';

  @override
  String get catalogAgentPresets => 'Predefinições do agente';

  @override
  String get catalogAgentPresetsSummary => 'Como funcionam novos chats';

  @override
  String get catalogModels => 'Modelos';

  @override
  String get catalogModelsSummary => 'Assinaturas e fornecedores personalizados';

  @override
  String get catalogSubagentSettings => 'Configuração do subagente';

  @override
  String get catalogSubagentSettingsSummary => 'Profundidade, paralelismo e modelos';

  @override
  String get catalogAgentLoop => 'Loop do agente';

  @override
  String get catalogAgentLoopSummary => 'Limite de chamada de ferramentas paralelo';

  @override
  String get catalogShellSettings => 'Execução de comandos';

  @override
  String get catalogShellSettingsSummary => 'Tempo limite e limite de saída';

  @override
  String get catalogWebSearch => 'Pesquisa Web';

  @override
  String get catalogWebSearchSummary => 'Serviço de pesquisa e orçamento';

  @override
  String get catalogPlugins => 'Plugins';

  @override
  String get catalogPluginsSummary => 'Plug-ins e mercados instalados';

  @override
  String get catalogPluginInventory => 'Inventário de plug-ins';

  @override
  String get catalogPluginInventorySummary => 'Todos os plug-ins carregados';

  @override
  String get catalogCordisSummary => 'Painéis dinâmicos de plugins';

  @override
  String get catalogAgentTeam => 'Equipa de agentes';

  @override
  String get catalogAgentTeamSummary => 'Membros, quadro de tarefas e mensagens';

  @override
  String get catalogCotTranslation => 'Traduzir o pensamento';

  @override
  String get catalogCotTranslationSummary => 'Expanda o pensamento e, em seguida, toque em \"Traduzir\"';

  @override
  String get catalogVoiceInput => 'Entrada de voz';

  @override
  String get catalogVoiceInputSummary => 'Microfone no compositor';

  @override
  String get catalogCommunitySharingSection => 'Comunidade e compartilhamento';

  @override
  String get catalogForum => 'Fórum';

  @override
  String get catalogForumSummary => 'Pergunte, compartilhe e conheça outros';

  @override
  String get catalogCommunity => 'Comunidade';

  @override
  String get catalogCommunitySummary => 'Destaques e chats em grupo';

  @override
  String get catalogBotSummary => 'Equipes bot e bate-papo em grupo';

  @override
  String get catalogShareProfile => 'Compartilhar a configuração';

  @override
  String get catalogShareProfileSummary => 'Plug-ins, configurações e habilidades';

  @override
  String get catalogHostsSettingsSection => 'Máquinas e configurações';

  @override
  String get catalogSearch => 'Procurar chats';

  @override
  String get catalogSearchSummary => 'Procurar por título ou conteúdo';

  @override
  String get catalogNotifications => 'Notificação';

  @override
  String get catalogNotificationsSummary => 'Alertas de conclusão e aprovação';

  @override
  String get catalogWorkspaces => 'Espaços de trabalho';

  @override
  String get catalogWorkspacesSummary => 'Adicionar e alternar pastas';

  @override
  String get catalogGeneral => 'Geral';

  @override
  String get catalogGeneralSummary => 'Apresentar, enviar e registar os envios';

  @override
  String get catalogAccount => 'Conta';

  @override
  String get catalogAccountSummary => 'Iniciar sessão, equilíbrio e recargas';

  @override
  String get catalogRemoteSummary => 'Conectar a um computador ou servidor';

  @override
  String get catalogPhoneControl => 'Controle telefónico';

  @override
  String get catalogPhoneControlSummary => 'Veja o seu tela e toque em para si';

  @override
  String get catalogEngine => 'Motor local';

  @override
  String get catalogEngineSummary => 'Status do motor e registros neste celular';

  @override
  String get catalogDiagnostics => 'Diagnósticos';

  @override
  String get catalogDiagnosticsSummary => 'Pacote de diagnósticos de exportação';

  @override
  String get catalogWebSummary => 'Interface DSH oficial';

  @override
  String get catalogPluginPanel => 'Painel de plug-in';

  @override
  String get catalogHostPluginMissing => 'Esta máquina não tem este plugin';

  @override
  String get catalogAllFeatures => 'Todas as funcionalidades';

  @override
  String get catalogAllFeaturesSubtitle => 'Recursos Web DSH, todos aqui';

  @override
  String get catalogOpenChatFirst => 'Abrir uma conversa primeiro';

  @override
  String get catalogNoOpenChat => 'Nenhuma conversa aberta';

  @override
  String get catalogOpenChat => 'Abrir o chat de momento';

  @override
  String get catalogOpenOrCreateChat => 'Abrir ou iniciar uma conversa primeiro';

  @override
  String get catalogCordisHostClient => 'Infraestrutura e interface';

  @override
  String get catalogCordisHostOnly => 'Apenas infra- estrutura';

  @override
  String get catalogCordisClientOnly => 'Apenas interface';

  @override
  String get catalogCordisPluginGone => 'Este plugin foi-se';

  @override
  String get catalogCordisStopFailed => 'Não foi possível parar';

  @override
  String get catalogCordisRemoveOne => 'Isto vai parar e apagá-lo.';

  @override
  String get catalogCordisRemove => 'Remover';

  @override
  String get catalogCordisRemoved => 'Removido';

  @override
  String get catalogCordisRemoveFailed => 'Não foi possível remover';

  @override
  String get catalogCordisChat => 'Conversar';

  @override
  String get catalogCordisMakeup => 'Componentes';

  @override
  String get catalogCordisStopping => 'Parar...';

  @override
  String get catalogCordisRemoving => 'Removendo...';

  @override
  String get catalogSeatGone => 'Plugin não está mais disponível';

  @override
  String catalogCordisRemoveTitle(String name) {
    return 'Remover “$name”?';
  }

  @override
  String catalogCordisRemoveVersions(int versions) {
    String _temp0 = intl.Intl.pluralLogic(
      versions,
      locale: localeName,
      other: 'Isto irá parar e apagar tudo $versions versões.',
      one: 'Isto irá pará-lo e apagar 1 versão.',
    );
    return '$_temp0';
  }

  @override
  String catalogCordisVersionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count versões', one: '1 versão');
    return '$_temp0';
  }

  @override
  String get catalogToolsSection => 'Ferramentas';

  @override
  String get catalogAllSettings => 'Todas as configurações';

  @override
  String get chatBackgroundTaskNotice => 'Aviso de tarefa em segundo plano';

  @override
  String get chatBackgroundTaskMessage => 'Mensagem de tarefa em segundo plano';

  @override
  String get chatDeclineQuestion => 'Pular';

  @override
  String get chatChats => 'Conversas';

  @override
  String get chatViewChatDetails => 'Ver detalhes da conversa';

  @override
  String get chatUnsent => 'Não enviado';

  @override
  String get chatSteerNextStep => 'Orientar · Próxima etapa';

  @override
  String get chatQueuedAfterTurn => 'Na fila · Próxima rodada';

  @override
  String get chatSteering => 'Orientando';

  @override
  String get chatQueued => 'Em fila';

  @override
  String get chatStoppingTurn => 'Interrompendo esta rodada';

  @override
  String get chatSending => 'Enviando';

  @override
  String get chatSendNow => 'Enviar agora';

  @override
  String get chatSwitchToSteer => 'Orientar em vez disso';

  @override
  String get chatWithdraw => 'Desfazer';

  @override
  String get chatContinuedInNewChat => 'Continua em uma nova conversa';

  @override
  String get chatReadOriginalImageFailed => 'Não foi possível ler a imagem original. Tente novamente.';

  @override
  String get chatRegenerateFailed => 'Não foi possível regenerar';

  @override
  String get chatRegeneratedInNewChat => 'Regenerado em um novo chat';

  @override
  String get chatOpenedInNewChatReattach => 'Aberto em uma nova conversa. Adicione os anexos novamente.';

  @override
  String get chatOpenedInNewChat => 'Aberto em uma nova conversa';

  @override
  String chatForkQueuedLeft(String message, int left) {
    String _temp0 = intl.Intl.pluralLogic(
      left,
      locale: localeName,
      other: '$message ($left mensagens continuaram na fila)',
      one: '$message (1 mensagem continuou na fila)',
    );
    return '$_temp0';
  }

  @override
  String get chatReturnToOriginal => 'Voltar à conversa original';

  @override
  String chatWaitingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens precisam de aprovação',
      one: '1 item precisa de aprovação',
    );
    return '$_temp0';
  }

  @override
  String chatWaitingBackToBottom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens precisam de aprovação; ir para o fim',
      one: '1 item precisa de aprovação; ir para o fim',
    );
    return '$_temp0';
  }

  @override
  String get chatBackToBottom => 'Ir para o fim';

  @override
  String get chatCreateFailed => 'Não foi possível criar a conversa';

  @override
  String get chatSendMode => 'Modo de envio';

  @override
  String get chatSteer => 'Orientar';

  @override
  String get chatSteerHint => 'A IA verá a mensagem na próxima etapa, sem interromper';

  @override
  String get chatInterruptAndSend => 'Interromper e enviar';

  @override
  String get chatInterruptHint => 'Parar a tarefa atual e lidar com isso primeiro';

  @override
  String get chatQueue => 'Fila';

  @override
  String get chatQueueHint => 'Enviar após esta rodada';

  @override
  String get chatWithdrawnEditable => 'Desfeito. Edite e envie novamente.';

  @override
  String get chatWithdrawn => 'Desfeito';

  @override
  String chatAttachmentLimit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Até $count anexos por mensagem',
      one: 'Até 1 anexo por mensagem',
    );
    return '$_temp0';
  }

  @override
  String get chatAttachmentPermission => 'Permissão negada. Ative-a nas configurações do sistema.';

  @override
  String get chatOpenAttachmentFailed => 'Não foi possível abrir o anexo';

  @override
  String get chatReadFailed => 'Não foi possível ler';

  @override
  String get chatReadImageFailed => 'Não foi possível ler a imagem';

  @override
  String get chatOpenChatFirst => 'Abra uma conversa primeiro';

  @override
  String get chatTurnCompleted => 'Esta rodada terminou';

  @override
  String get chatTurnError => 'Ocorreu um erro nesta rodada';

  @override
  String get chatAnswerHint => 'Digite sua resposta…';

  @override
  String get chatStarting => 'Iniciando';

  @override
  String get chatConnecting => 'Conectando';

  @override
  String get chatDisconnected => 'Desconectado';

  @override
  String get chatReconnecting => 'Reconectando';

  @override
  String get chatGenerating => 'Gerando';

  @override
  String get chatGoToSettings => 'Abrir configurações';

  @override
  String get chatListeningEllipsis => 'Ouvindo…';

  @override
  String get chatTranscribingEllipsis => 'Transcrevendo…';

  @override
  String get chatConnectToSend => 'Conecte-se ao mecanismo para enviar mensagens';

  @override
  String get chatGeneratingSteerHint => 'Gerando · Digite para orientar';

  @override
  String get chatComposerHint => 'Escreva para o DSH…';

  @override
  String get chatStopGenerating => 'Interromper geração';

  @override
  String get chatVoiceInput => 'Entrada de voz';

  @override
  String get chatStopVoiceInput => 'Parar a entrada de voz';

  @override
  String get chatGoal => 'Objetivo';

  @override
  String get chatGoalActions => 'Ações do objetivo';

  @override
  String get chatGoalBlocked => 'Bloqueado';

  @override
  String chatGoalRoundLimit(int rounds, int max) {
    return 'Rodada $rounds / $max';
  }

  @override
  String chatGoalRound(int rounds) {
    return 'Rodada $rounds';
  }

  @override
  String get chatEditGoal => 'Editar objetivo';

  @override
  String get chatPauseGoal => 'Pausar';

  @override
  String get chatPauseGoalHint => 'Pausar o progresso automático';

  @override
  String get chatResumeGoal => 'Continuar';

  @override
  String get chatResumeGoalHint => 'Continuar o progresso automático';

  @override
  String get chatClearGoal => 'Limpar objetivo';

  @override
  String get chatGoalHint => 'O que você quer alcançar?';

  @override
  String get chatClearGoalTitle => 'Limpar objetivo?';

  @override
  String chatTodoCurrent(String content) {
    return 'Em andamento: $content';
  }

  @override
  String chatTodoNext(String content) {
    return 'Próximo: $content';
  }

  @override
  String get chatTodoAllDone => 'Tudo pronto';

  @override
  String chatTodoSemantics(String count, String label) {
    return 'A fazer: $count, $label';
  }

  @override
  String get chatCollapseTodos => 'Recolher lista';

  @override
  String get chatExpandTodos => 'Expandir lista';

  @override
  String get chatTodoNotStarted => 'Não iniciado';

  @override
  String get chatFile => 'Arquivo';

  @override
  String get chatFolder => 'Pasta';

  @override
  String get chatChat => 'Conversa';

  @override
  String get chatSubagent => 'Subagente';

  @override
  String get chatRecent => 'Recente';

  @override
  String get chatMentionSearching => 'Pesquisando...';

  @override
  String get chatMentionNoFiles => 'Sem arquivos correspondentes';

  @override
  String get chatMentionNoMatches => 'Sem arquivos ou conversas correspondentes';

  @override
  String get chatQuote => 'Citação';

  @override
  String get chatOpenFolder => 'Abrir pasta';

  @override
  String get chatJustNow => 'Agora mesmo';

  @override
  String chatMentionAgeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min', one: '1 min');
    return '$_temp0';
  }

  @override
  String chatMentionAgeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count h', one: '1 h');
    return '$_temp0';
  }

  @override
  String chatMentionAgeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count dias', one: '1 dia');
    return '$_temp0';
  }

  @override
  String chatMentionAgeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count meses', one: '1 mês');
    return '$_temp0';
  }

  @override
  String chatMentionAgeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count anos', one: '1 ano');
    return '$_temp0';
  }

  @override
  String get chatMermaidChart => 'Diagrama Mermaid';

  @override
  String get chatPreview => 'Prévia';

  @override
  String get chatUnwrapLines => 'Desativar quebra de linhas';

  @override
  String get chatWrapLines => 'Quebrar linhas';

  @override
  String get chatAlertNote => 'Nota';

  @override
  String get chatAlertTip => 'Dica';

  @override
  String get chatAlertImportant => 'Importante';

  @override
  String get chatAlertWarning => 'Atenção';

  @override
  String get chatAlertCaution => 'Atenção';

  @override
  String get chatImage => 'Imagem';

  @override
  String get chatImageNotFound => 'Imagem não encontrada';

  @override
  String get chatImageOffline => 'Não conectado ao DSH';

  @override
  String get chatImageTooLarge => 'Imagem muito grande';

  @override
  String get chatImageReadFailed => 'Não é possível ler o arquivo';

  @override
  String get chatImageDisplayFailed => 'Não é possível exibir';

  @override
  String get chatImageTapToView => 'Toque para visualizar';

  @override
  String get chatImageTapToRetry => 'Toque para tentar novamente';

  @override
  String get chatImageUnsupportedAddress => 'Endereço não suportado';

  @override
  String get chatMermaidNeedsNetwork => 'Precisa de internet';

  @override
  String get chatMermaidSyntaxError => 'Sintaxe de gráfico inválida';

  @override
  String get chatChartPreview => 'Visualização do gráfico';

  @override
  String get chatCopyCode => 'Copiar código';

  @override
  String get chatChartClosed => 'Gráfico fechado';

  @override
  String get chatVoiceMicrophoneFailed => 'Não foi possível abrir o microfone';

  @override
  String get chatVoicePermissionOff => 'O acesso ao microfone está desativado';

  @override
  String get chatVoicePermissionNeeded => 'A entrada de voz requer acesso ao microfone';

  @override
  String get chatVoiceUnavailable => 'Reconhecimento de fala não está disponível neste celular';

  @override
  String get chatVoiceNotHeard => 'Não percebi isso. Tente novamente.';

  @override
  String get chatVoiceTranscriptionFailed => 'Não foi possível transcrever esta gravação';

  @override
  String get chatVoiceNetworkFailed => 'Não foi possível transcrever. Verifique sua conexão.';

  @override
  String get chatVoiceLanguageUnsupported => 'Este idioma ainda não é suportado';

  @override
  String get chatVoiceMicrophoneBusy => 'Microfone em uso';

  @override
  String get chatVoiceBusy => 'O reconhecimento de fala está ocupado. Tente novamente mais tarde.';

  @override
  String get chatVoiceRecognitionFailed => 'Falha no reconhecimento de fala';

  @override
  String get chatListening => 'Ouvindo';

  @override
  String get chatTranscribing => 'Transcrevendo';

  @override
  String get chatCancelVoiceInput => 'Cancelar a entrada de voz';

  @override
  String get chatViewTurnTrace => 'Ver detalhes da rodada';

  @override
  String chatTokensPerSecond(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerca de $count tokens/s',
      one: 'Cerca de 1 token/s',
    );
    return '$_temp0';
  }

  @override
  String get chatNoTokensStreaming => 'Nenhum texto recebido ainda';

  @override
  String chatCurrentStep(String step) {
    return 'Etapa $step';
  }

  @override
  String chatTodoProgress(int done, int total) {
    return 'Progresso das tarefas: $done/$total';
  }

  @override
  String chatProgress(int done, int total) {
    return 'Progresso $done/$total';
  }

  @override
  String get chatApproveCommand => 'Permitir este comando?';

  @override
  String get chatApproveWrite => 'Permitir a escrita deste arquivo?';

  @override
  String get chatApproveEdit => 'Permitir editar este arquivo?';

  @override
  String get chatApproveWebpage => 'Permitir a abertura desta página?';

  @override
  String get chatApproveSearch => 'Permitir a pesquisa na Web?';

  @override
  String chatApproveTool(String name) {
    return 'Permitir “$name”?';
  }

  @override
  String get chatDecline => 'Recusar';

  @override
  String get chatAllowOnce => 'Permitir uma vez';

  @override
  String get chatAllowForChat => 'Permitir nesta conversa';

  @override
  String get chatSaveToDownloads => 'Salvar em Downloads';

  @override
  String get chatCopyPath => 'Copiar o caminho';

  @override
  String get chatOpenInDefaultApp => 'Abrir no aplicativo padrão';

  @override
  String get chatDownloadsFolderHint => 'Transferências/DSH-Go';

  @override
  String chatSavedToDownloadsPath(String path) {
    return 'Salvo em Downloads/$path';
  }

  @override
  String chatSavedToPath(String path) {
    return 'Salvo em $path';
  }

  @override
  String chatDeliveredFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos entregues',
      one: '1 arquivo entregue',
    );
    return '$_temp0';
  }

  @override
  String chatGeneratedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos gerados',
      one: '1 arquivo gerado',
    );
    return '$_temp0';
  }

  @override
  String chatAllFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos no total',
      one: '1 arquivo no total',
    );
    return '$_temp0';
  }

  @override
  String get chatCollapseFileList => 'Recolher a lista de arquivos';

  @override
  String chatExpandAllFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expandir $count arquivos',
      one: 'Expandir 1 arquivo',
    );
    return '$_temp0';
  }

  @override
  String get chatDownloading => 'Baixando...';

  @override
  String chatDownloadingPercent(int percent) {
    return 'Baixando... $percent%';
  }

  @override
  String get chatOpening => 'Abrindo…';

  @override
  String get chatSavingToDownloads => 'Salvando em Downloads…';

  @override
  String get chatOpenInPhoneApp => 'Abrir em um aplicativo deste celular';

  @override
  String get chatMoreActions => 'Mais ações';

  @override
  String get chatAlreadyInDownloads => 'Já em Downloads neste celular';

  @override
  String get chatArtifactCopyPathOnly => 'Esta conexão não pode ler arquivos. Você pode copiar o caminho.';

  @override
  String get chatReplying => 'Respondendo';

  @override
  String get chatInterrupted => 'Interrompido';

  @override
  String get chatGallery => 'Fotos';

  @override
  String get chatTakePhoto => 'Tirar uma foto';

  @override
  String get chatAddAttachment => 'Adicionar imagem ou arquivo';

  @override
  String chatRemoveAttachment(String name) {
    return 'Remover “$name”';
  }

  @override
  String get chatAutoApproveCommands => 'Permitir comandos automaticamente';

  @override
  String get chatAutoApproving => 'Auto- aprovação';

  @override
  String chatViewMoreChanges(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ver alterações em mais $count arquivos',
      one: 'Ver alterações em mais 1 arquivo',
    );
    return '$_temp0';
  }

  @override
  String get chatViewChanges => 'Ver as alterações';

  @override
  String chatChangedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos alterados',
      one: '1 arquivo alterado',
    );
    return '$_temp0';
  }

  @override
  String chatMoreFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mais $count arquivos',
      one: 'Mais 1 arquivo',
    );
    return '$_temp0';
  }

  @override
  String chatFileChangeSemantics(String path, int added, int removed) {
    String _temp0 = intl.Intl.pluralLogic(
      added,
      locale: localeName,
      other: '$added linhas adicionadas',
      one: '1 linha adicionada',
    );
    String _temp1 = intl.Intl.pluralLogic(
      removed,
      locale: localeName,
      other: '$removed linhas removidas',
      one: '1 linha removida',
    );
    return '$path, $_temp0, $_temp1';
  }

  @override
  String get chatNewFileSuffix => '  Novo';

  @override
  String get chatPathCopied => 'Caminho copiado';

  @override
  String chatCommandCompacted(int count, String tokens) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens do histórico compactados (~$tokens tokens)',
      one: '1 item do histórico compactado (~$tokens tokens)',
    );
    return '$_temp0';
  }

  @override
  String chatCommandPermissionChanged(String name) {
    return 'Alternado para $name';
  }

  @override
  String chatCommandCurrentPermission(String name) {
    return 'Permissões atuais: $name';
  }

  @override
  String get chatCommandUnknownPermission => 'Essa configuração de permissão não existe';

  @override
  String get chatCommandFeedbackRequired => 'Adicionar feedback antes de enviar';

  @override
  String get chatCommandFeedbackSubmitted => 'Feedback enviado';

  @override
  String get chatCommandNothingToCompact => 'Nada para compactar ainda';

  @override
  String get chatCommandCompactionCancelled => 'Compactação cancelada';

  @override
  String get chatCommandCompactionBusy => 'Ocupado. Tente compactar mais tarde.';

  @override
  String get chatCommandCompactedSaveFailed => 'Compactado, mas não foi possível salvar';

  @override
  String get chatCommandCompactUsage => '/compact não aceita argumentos';

  @override
  String get chatCommandHistoryChanged => 'A conversa mudou. Tente novamente.';

  @override
  String get chatCommandCompactionFailed => 'Não foi possível compactar. Tente novamente.';

  @override
  String get chatCommandCompactionIncomplete => 'Compactação incompleta. Verifique a conversa.';

  @override
  String get chatCommandPlanEnabled => 'Modo de planejamento ativado';

  @override
  String get chatCommandPlanEnabling => 'O modo de planejamento começa na próxima etapa';

  @override
  String get chatCommandPlanDisabled => 'Modo de planejamento desativado';

  @override
  String get chatCommandPlanDisabling => 'O modo de planejamento termina na próxima etapa';

  @override
  String get chatCommandPlanCancelled => 'Entrada no modo de planejamento cancelada';

  @override
  String get chatCommandPlanInactive => 'O modo de planejamento está desativado';

  @override
  String get chatCommandPlanNoAttachments => 'Não é possível anexar arquivos ao sair do modo plano';

  @override
  String get chatCommandNoGoal => 'Nenhum objetivo ainda';

  @override
  String get chatCommandGoalRequired => 'Adicionar um novo objetivo antes de enviar';

  @override
  String get chatCommandGoalAttachments => 'Enviar anexos com um objetivo';

  @override
  String get chatCommandGoalCleared => 'Objetivo removido';

  @override
  String get chatCommandGoalInvalid => 'Não foi possível fazer isso agora. Verifique o objetivo.';

  @override
  String get chatCommandGoalExists => 'Já existe um objetivo. Edite ou remova antes de criar outro.';

  @override
  String get chatCommandGoalCreated => 'Objetivo definido';

  @override
  String get chatCommandGoalUpdated => 'Objetivo atualizado';

  @override
  String get chatCommandGoalPaused => 'Objetivo pausado';

  @override
  String get chatCommandGoalResumed => 'Objetivo retomado';

  @override
  String get chatCommandCurrentGoal => 'Objetivo atual';

  @override
  String get chatCommandGoalBlocked => 'Precisa de atenção';

  @override
  String chatCommandGoalSummary(String title, String objective, String status, int rounds, int max) {
    return '$title\n$objective\n$status · Rodada $rounds/$max';
  }

  @override
  String get chatCommandFailed => 'Falha no comando';

  @override
  String get chatImageStorageDenied => 'Não foi possível salvar. O acesso ao armazenamento está desligado.';

  @override
  String get chatImageCannotSave => 'Não é possível gravar esta imagem';

  @override
  String get chatImageDownloadFailed => 'Não foi possível baixar a imagem. Tente novamente.';

  @override
  String get chatImageSaveFailed => 'Não foi possível salvar. Tente novamente.';

  @override
  String get chatImageSavedToPhotos => 'Salvo em Fotos';

  @override
  String get chatShareFailed => 'Não foi possível abrir o compartilhamento';

  @override
  String get chatSubmit => 'Enviar';

  @override
  String get chatSelectText => 'Selecionar texto';

  @override
  String get chatRegenerate => 'Regenerar';

  @override
  String get chatBranchFromHere => 'Criar ramificação aqui';

  @override
  String get chatEditAndResend => 'Editar e enviar novamente';

  @override
  String get chatRegenerateHint => 'Regenera em uma nova conversa. A original permanece.';

  @override
  String get chatBranchHint => 'Continua em uma nova conversa. A original permanece.';

  @override
  String get chatEditResendHint => 'Edita em uma nova conversa. A original permanece.';

  @override
  String get chatSaveToPhotos => 'Salvar em Fotos';

  @override
  String get chatCopyAll => 'Copiar tudo';

  @override
  String get chatRequestRetrying => 'A solicitação falhou; tentando novamente';

  @override
  String chatRequestRetryAttempt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'A solicitação falhou, tentando novamente (tentativa $count)',
      one: 'A solicitação falhou, tentando novamente (tentativa 1)',
    );
    return '$_temp0';
  }

  @override
  String chatRequestRetryLimit(int count, int max) {
    return 'A solicitação falhou; tentando novamente ($count/$max)';
  }

  @override
  String chatSubscriptionExpired(String name) {
    return 'A assinatura de $name expirou';
  }

  @override
  String get chatProviderKeyMissing => 'Nenhuma chave de API para este provedor ainda';

  @override
  String get chatDeepSeekKeyMissing => 'Nenhuma chave de API DeepSeek ainda';

  @override
  String get chatOutputLimitReached => 'Limite de saída atingido';

  @override
  String get chatTurnBlocked => 'Esta rodada foi bloqueada';

  @override
  String get chatTurnEngineRestarted => 'O mecanismo reiniciou e interrompeu esta rodada';

  @override
  String get chatSignInAgain => 'Entre novamente';

  @override
  String chatQuestionsTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perguntas para você',
      one: '1 pergunta para você',
    );
    return '$_temp0';
  }

  @override
  String get chatOneQuestion => 'Uma pergunta para você';

  @override
  String get chatMultipleChoices => 'Selecione uma ou mais opções';

  @override
  String get chatCustomAnswer => 'Outra resposta';

  @override
  String get chatCustomAnswerHint => 'Digite sua resposta';

  @override
  String chatQuoteSemantics(String text) {
    return 'Citação: $text';
  }

  @override
  String get chatRemoveQuote => 'Remover citação';

  @override
  String get chatReadOnlySubagent => 'Visualização do subagente · Somente leitura';

  @override
  String get chatThinkingActive => 'Pensando';

  @override
  String get chatThinking => 'Raciocínio';

  @override
  String get chatTranslate => 'Traduzir';

  @override
  String get chatTranslationUnavailable => 'Tradução não disponível';

  @override
  String get chatViewOriginal => 'Ver original';

  @override
  String get chatViewTranslation => 'Ver tradução';

  @override
  String get chatTranslating => 'Traduzindo';

  @override
  String chatToolFailures(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$label, $count falhas',
      one: '$label, 1 falha',
    );
    return '$_temp0';
  }

  @override
  String get chatToolNeedsApproval => 'Aprovação necessária para execução';

  @override
  String get chatCommand => 'Comando';

  @override
  String chatToolLineRange(int first, int last) {
    return ' · Linhas $first⁠–⁠$last';
  }

  @override
  String get chatParameters => 'Parâmetros';

  @override
  String get chatOutput => 'Saída';

  @override
  String get chatResult => 'Resultado';

  @override
  String get chatError => 'Erro';

  @override
  String get chatChanges => 'Alterações';

  @override
  String get chatContent => 'Conteúdo';

  @override
  String get chatNoOutput => 'Sem saída';

  @override
  String get chatToolDeclined => 'Esta chamada de ferramenta foi recusada';

  @override
  String get chatToolRunning => 'Em execução…';

  @override
  String get chatNoDetails => 'Sem detalhes ainda';

  @override
  String get chatErrApiKey => 'A chave de API é inválida ou expirou';

  @override
  String get chatErrBalance => 'Saldo insuficiente';

  @override
  String get chatErrAccountQuota => 'Cota da conta esgotada';

  @override
  String get chatErrRateLimit => 'Muitas solicitações. Tente novamente mais tarde.';

  @override
  String get chatErrContextLength => 'A conversa ficou longa demais. Envie /compact e tente novamente.';

  @override
  String get chatErrModelUnavailable => 'Serviço de modelo temporariamente indisponível';

  @override
  String get chatErrModelTimeout => 'Tempo de resposta do modelo esgotado';

  @override
  String get chatErrModelConnection => 'Não foi possível conectar ao serviço do modelo';

  @override
  String get chatErrModelEmpty => 'O modelo não retornou conteúdo';

  @override
  String get chatErrEngineOutdated => 'Este modelo requer uma versão mais recente do mecanismo';

  @override
  String get chatErrModelUnsupported => 'Este modelo não está disponível';

  @override
  String get chatSwitchModel => 'Mudar de modelo';

  @override
  String get chatErrTurn => 'Ocorreu um erro nesta rodada.';

  @override
  String chatTurnSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count etapas', one: '1 etapa');
    return '$_temp0';
  }

  @override
  String chatTurnFootnoteSemantics(String summary) {
    return 'Nesta rodada: $summary; ver detalhes da rodada';
  }

  @override
  String chatTurnToolCalls(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chamadas de ferramentas',
      one: '1 chamada de ferramenta',
    );
    return '$_temp0';
  }

  @override
  String chatTurnMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count mensagens', one: '1 mensagem');
    return '$_temp0';
  }

  @override
  String chatTurnThoughts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count blocos de pensamento',
      one: '1 bloco de pensamento',
    );
    return '$_temp0';
  }

  @override
  String get chatMe => 'Eu';

  @override
  String chatGoalSemantics(String objective) {
    return 'Objetivo $objective';
  }

  @override
  String chatGoalStateSemantics(String objective, String state) {
    return 'Objetivo $objective, $state';
  }

  @override
  String chatTodoItemSemantics(String content, String state) {
    return '$content, $state';
  }

  @override
  String chatMentionSemantics(String kind, String label) {
    return '$kind: $label';
  }

  @override
  String chatArtifactSemantics(String name, String description) {
    return '$name, $description';
  }

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonRetry => 'Tentar novamente';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonCopied => 'Copiado';

  @override
  String get commonSave => 'Salvar';

  @override
  String get commonSettings => 'Configurações';

  @override
  String get commonBack => 'Voltar';

  @override
  String get commonCopy => 'Copiar';

  @override
  String get commonDone => 'Concluído';

  @override
  String get commonDelete => 'Excluir';

  @override
  String get commonInstall => 'Instalar';

  @override
  String get commonShare => 'Compartilhar';

  @override
  String get commonAdd => 'Adicionar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonClear => 'Limpar';

  @override
  String get commonCollapse => 'Mostrar menos';

  @override
  String get commonEnable => 'Ativar';

  @override
  String get commonOpen => 'Abrir';

  @override
  String get commonDetails => 'Detalhes';

  @override
  String get commonMore => 'Mais';

  @override
  String get commonCreate => 'Criar';

  @override
  String get commonSend => 'Enviar';

  @override
  String get commonStop => 'Parar';

  @override
  String get commonPaste => 'Colar';

  @override
  String get commonHide => 'Ocultar';

  @override
  String get commonLater => 'Mais tarde';

  @override
  String get commonConfirm => 'Confirmar';

  @override
  String get commonRename => 'Renomear';

  @override
  String get commonContinue => 'Continuar';

  @override
  String get commonNotSet => 'Não definido';

  @override
  String get commonDefault => 'Padrão';

  @override
  String get commonSaved => 'Salvo';

  @override
  String get commonSaveFailed => 'Não foi possível salvar';

  @override
  String get commonSaveFailedRetry => 'Não foi possível salvar. Tente novamente.';

  @override
  String get commonFailedTryAgain => 'Algo correu mal. Tente novamente.';

  @override
  String get commonEngineUnreachable => 'Não foi possível conectar ao mecanismo';

  @override
  String get commonStorageFull => 'Armazenamento insuficiente';

  @override
  String get commonConnectionFailed => 'Não foi possível conectar';

  @override
  String get commonCopyLink => 'Copiar link';

  @override
  String get commonOpenWith => 'Abrir em outro aplicativo';

  @override
  String get commonOpenInWeb => 'Abrir na Web DSH';

  @override
  String get commonUntitledChat => 'Conversa sem título';

  @override
  String get commonNewChat => 'Nova conversa';

  @override
  String get commonYesterday => 'Ontem';

  @override
  String get commonSignedIn => 'Conectado';

  @override
  String get commonSignIn => 'Entrar';

  @override
  String get commonSignOut => 'Sair';

  @override
  String get commonThisPhone => 'Este celular';

  @override
  String get commonRemoteHost => 'Máquina remota';

  @override
  String get commonWeb => 'Web';

  @override
  String get commonFollowSystem => 'Sistema';

  @override
  String get commonLight => 'Claro';

  @override
  String get commonDark => 'Escuro';

  @override
  String get commonInProgress => 'Em curso';

  @override
  String get commonCompleted => 'Concluído';

  @override
  String get commonStopped => 'Parado';

  @override
  String get commonCancelled => 'Cancelado';

  @override
  String get commonRunning => 'Em execução';

  @override
  String get commonPaused => 'Pausa';

  @override
  String get commonDeclined => 'Recusado';

  @override
  String get commonFailed => 'Falha';

  @override
  String get commonStopping => 'Parar';

  @override
  String get commonWaitingApproval => 'Necessita de aprovação';

  @override
  String get commonWaitingAnswer => 'Precisa da sua resposta';

  @override
  String get commonNotConnected => 'Não conectado';

  @override
  String get commonInstalled => 'Instalado';

  @override
  String get commonName => 'Nome';

  @override
  String get commonStatus => 'Status';

  @override
  String get commonVersion => 'Versão';

  @override
  String get commonOther => 'Outros';

  @override
  String get commonPin => 'Fixar';

  @override
  String get commonReply => 'Responder';

  @override
  String get commonUpdate => 'Atualizar';

  @override
  String get commonViewLogs => 'Ver logs';

  @override
  String commonItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count itens', one: '1 item');
    return '$_temp0';
  }

  @override
  String commonMonthDay(String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Fev',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'Maio',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Out',
      '11': 'Nov',
      '12': 'Dez',
      'other': '$month',
    });
    return '$_temp0 $day';
  }

  @override
  String get engineAccountSignedIn => 'Assinado em DeepSeek';

  @override
  String get engineAccountSignOutTitle => 'Sair de DeepSeek?';

  @override
  String get engineAccountSignOutBusy =>
      'Algumas tarefas estão usando modelos de conta. A assinatura interrompe-os imediatamente. Suas conversas e arquivos ficam.';

  @override
  String get engineAccountSignOutBody =>
      'Os modelos da conta ficarão indisponíveis. Suas conversas, arquivos e chave de API permanecerão salvos. Você pode entrar novamente quando quiser.';

  @override
  String get engineAccountSignOutUnknown =>
      'Não é possível verificar se quaisquer tarefas estão usando modelos de conta. Sair interrompe qualquer um.';

  @override
  String get engineAccountSignOutFailed => 'Não consegui sair. Tente novamente mais tarde.';

  @override
  String get engineAccountTitle => 'Conta';

  @override
  String get engineAccountRefresh => 'Atualizar';

  @override
  String get engineAccountDeepSeek => 'Conta DeepSeek';

  @override
  String get engineAccountProfileUnavailable => 'Não é possível carregar detalhes da conta agora';

  @override
  String get engineAccountBalance => 'Saldo';

  @override
  String get engineAccountBalanceHint => 'Os modelos de conta são cobrados ao seu saldo';

  @override
  String get engineAccountBalanceEngineOff => 'Ligue o motor para ver o seu equilíbrio';

  @override
  String get engineAccountTopUp => 'Completar';

  @override
  String get engineAccountUsageDetails => 'Detalhes de uso';

  @override
  String get engineAccountToppedUpBalance => 'Saldo de cobertura';

  @override
  String get engineAccountGrantedBalance => 'Saldo concedido';

  @override
  String get engineAccountBalanceUnavailable => 'Não é possível carregar seu equilíbrio agora';

  @override
  String get engineAccountNoKeyNeeded => 'Nenhuma chave de API necessária ao iniciar sessão';

  @override
  String get engineAccountUnsupported => 'Este motor não suporta a entrada da conta';

  @override
  String get engineAccountSignInDeepSeek => 'Iniciar sessão com DeepSeek';

  @override
  String get engineAccountAutoStart => 'A entrada inicia o motor automaticamente';

  @override
  String get engineAccountReplaceKey => 'Substituir a tecla';

  @override
  String get engineAccountClearKeyTitle => 'Limpar a chave da API?';

  @override
  String get engineAccountClearKeyBody =>
      'Apaga a chave salva na aplicativo. Enquanto o motor neste celular está funcionando, a chave no motor é excluída também.';

  @override
  String get engineAccountBrowserFailed => 'Não foi possível abrir o navegador';

  @override
  String get engineAccountSignInSuccess => 'Assinado em';

  @override
  String get engineAccountAlmostReady => 'Quase pronto.';

  @override
  String get engineAccountStartingEngine => 'Motor de arranque';

  @override
  String get engineAccountOpenSignInNext => 'A página de entrada abre a seguir';

  @override
  String get engineAccountPreparingSignIn => 'Preparação da entrada';

  @override
  String get engineAccountOpenDeepSeekNext => 'Abrir o sinal do DeepSeek';

  @override
  String get engineAccountFinishInBrowser => 'Terminar o login no seu navegador';

  @override
  String get engineAccountReturnToDsh => 'Voltar ao DSH Go após iniciar sessão';

  @override
  String get engineAccountFinishingSignIn => 'Terminar o registo';

  @override
  String get engineAccountSavingSignIn => 'A gravar os detalhes de entrada';

  @override
  String get engineAccountAwaitingResult => 'Ainda à espera da entrada';

  @override
  String get engineAccountCopySignInLink => 'Copiar a ligação de entrada';

  @override
  String get engineAccountReopenSignIn => 'Reabrir o registo';

  @override
  String get engineAccountCancelSignIn => 'Cancelar a entrada';

  @override
  String get engineAccountSignInLinkCopied => 'Ligação de entrada copiada';

  @override
  String get engineAccountSigningIn => 'Assinatura';

  @override
  String get engineAccountSignedOut => 'Assinado';

  @override
  String get engineAccountUsageFact => 'O uso é cobrado no saldo da sua conta';

  @override
  String get engineAccountBrowserFact => 'Inicie sessão com o seu navegador. O DSH nunca vê a sua senha';

  @override
  String get engineAccountCredentialsFact => 'As credenciais de login ficam neste celular';

  @override
  String get engineSubagentTitle => 'Subagente';

  @override
  String get engineAgentLoopTitle => 'Loop do agente';

  @override
  String get engineShellTitle => 'Execução de comandos';

  @override
  String get engineSearchTitle => 'Pesquisa Web';

  @override
  String get engineSearchNewApiBadge => 'Nova API';

  @override
  String get engineGeneralTitle => 'Geral';

  @override
  String get engineSettingsTitle => 'Parâmetros do motor';

  @override
  String get engineSettingsReadFailed => 'Não foi possível carregar as configurações';

  @override
  String get engineSettingsRun => 'Tempo de execução';

  @override
  String get engineSettingsPlugins => 'Plugins';

  @override
  String get engineSettingsPluginInventory => 'Inventário de plug-ins';

  @override
  String get engineSettingsPluginStopped => 'Plugin não está em execução';

  @override
  String get engineSettingsEnablePlugin => 'Habilite-o para alterar suas configurações';

  @override
  String get engineSettingsNoEditableFields => 'Nenhuma configuração a alterar aqui';

  @override
  String get engineFieldRestoreDefault => 'Reiniciar como padrão';

  @override
  String get engineFieldDecrease => 'Diminuir';

  @override
  String get engineFieldIncrease => 'Aumentar';

  @override
  String get engineFieldRemove => 'Remover';

  @override
  String get engineFieldShow => 'Mostrar';

  @override
  String get engineFieldFromEnvironment => 'Fornecido pelo ambiente de inicialização';

  @override
  String get engineFieldItem => 'item';

  @override
  String get engineFieldAlreadyAdded => 'Já adicionado';

  @override
  String get engineFieldEnterName => 'Digite um nome';

  @override
  String get engineFieldEnterNumber => 'Digite um número';

  @override
  String get engineFieldValue => 'Valor';

  @override
  String get engineFieldNew => 'Novo';

  @override
  String get engineFieldRequired => 'Requerido';

  @override
  String get engineGeneralMissing => 'Esta máquina não tem configurações gerais';

  @override
  String get engineSettingsVersionRequired => 'Requer DSH 0.2.1 ou posterior';

  @override
  String get engineGeneralWebDisplay => 'Visualização Web';

  @override
  String get engineGeneralWebSending => 'Envio Web';

  @override
  String get engineGeneralData => 'Dados';

  @override
  String get engineSubagentModelsTitle => 'Modelos de subagentes';

  @override
  String get engineChatLogTitle => 'Registros de chat';

  @override
  String get engineThinkingTranslationTitle => 'Pensar na tradução';

  @override
  String get enginePluginIndexesTitle => 'Índices de mercado de plug-ins';

  @override
  String get enginePermissionTitle => 'Permissão';

  @override
  String get engineAgentPresetsTitle => 'Predefinições do agente';

  @override
  String get engineDefaultModelTitle => 'Modelo padrão';

  @override
  String get engineWebAppearanceTitle => 'Aparência na Web';

  @override
  String get engineLanguageTitle => 'Língua';

  @override
  String get engineFieldCommandTimeout => 'Tempo limite de comando';

  @override
  String get engineFieldMaxOutput => 'Limite de saída';

  @override
  String get engineFieldMaxTimeout => 'Tempo limite máximo solicitado';

  @override
  String get engineFieldMaxSpill => 'Limite de arquivo despejo';

  @override
  String get engineFieldGracePeriod => 'Período de tolerância de cessação';

  @override
  String get engineFieldDefaultCwd => 'Pasta de trabalho padrão';

  @override
  String get engineFieldFollowChat => 'Seguir a conversa';

  @override
  String get engineSubagentMaxDepth => 'Profundidade máxima de recursão';

  @override
  String get engineFieldLayersUnit => 'níveis';

  @override
  String get engineSubagentMaxActive => 'Subagentes activos máximos';

  @override
  String get engineFieldCountUnit => 'itens';

  @override
  String get engineSubagentAllowModelChoice => 'Deixe o IA escolher modelos de subagente';

  @override
  String get engineSubagentAllowedModels => 'Modelos disponíveis';

  @override
  String get engineAgentMaxParallelCalls => 'Chamadas de ferramentas paralelas por passo';

  @override
  String get engineFieldSearchProvider => 'Serviço de pesquisa';

  @override
  String get engineFieldFetchProvider => 'Serviço de busca da Web';

  @override
  String get engineFieldBaseUrl => 'URL do serviço';

  @override
  String get engineSearchMaxUses => 'Máxima pesquisa por pedido';

  @override
  String get engineFieldTimesUnit => 'vezes';

  @override
  String get engineSearchHelperModel => 'Modelo helper';

  @override
  String get engineFieldApiVersion => 'Versão da API';

  @override
  String get engineFieldMaxTokens => 'Comprimento máximo de saída';

  @override
  String get engineSearchResultsPerSearch => 'Resultados por pesquisa';

  @override
  String get engineFieldResultsUnit => 'resultados';

  @override
  String get engineSearchSendOriginalQuestion => 'Incluir a sua pergunta original nas pesquisas';

  @override
  String get engineChatLogUpload => 'Enviar os registros de chat para o DeepSeek';

  @override
  String get engineTranslationProvider => 'Serviço de tradução';

  @override
  String get engineTranslationAccountPaid => 'Conta DeepSeek (pago)';

  @override
  String get engineTranslationApiPaid => 'API DeepSeek (pago)';

  @override
  String get engineTranslationTargetLanguage => 'Língua- alvo';

  @override
  String get engineTranslationFollowLanguage => 'Siga a linguagem da interface';

  @override
  String get engineTranslationLanguageHint => 'Digite auto ou um código de idioma, como zh, en ou ja';

  @override
  String get enginePluginIndexSources => 'Fontes de índice';

  @override
  String get enginePluginIndexUrl => 'URL do índice';

  @override
  String get engineFieldHttpUrlHint => 'Uma URL a começar por http:// ou https://';

  @override
  String get enginePermissionNewChat => 'Novas permissões de chat';

  @override
  String get engineAgentDefaultPreset => 'Predefinição predefinida do agente';

  @override
  String get engineProviderTitle => 'Fornecedor';

  @override
  String get engineModelTitle => 'Modelo';

  @override
  String get engineFieldReasoningEffort => 'Profundidade de pensamento';

  @override
  String get engineGeneralShowCodingView => 'Mostrar a área de codificação';

  @override
  String get engineGeneralWorkDetails => 'Detalhes do trabalho';

  @override
  String get engineFieldCompact => 'Compacto';

  @override
  String get engineFieldStandard => 'Padrão';

  @override
  String get engineFieldDetailed => 'Detalhado';

  @override
  String get engineFieldVerbose => 'Verbose';

  @override
  String get engineGeneralCollapseTiming => 'Quando colapsar detalhes do trabalho';

  @override
  String get engineGeneralOnCompletion => 'Após a conclusão';

  @override
  String get engineGeneralOnNewMessage => 'Na nova mensagem';

  @override
  String get engineGeneralPerformanceUsage => '& Utilização do desempenho';

  @override
  String get engineGeneralLinkOpening => 'Abrir links em';

  @override
  String get engineGeneralAppSidebar => 'Barra lateral da aplicativo';

  @override
  String get engineGeneralDefaultBrowser => 'Navegador padrão';

  @override
  String get engineGeneralBusySend => 'Enviar enquanto a IA está a funcionar';

  @override
  String get engineGeneralQueueSend => 'Fila';

  @override
  String get engineGeneralSteerSend => 'Rodar';

  @override
  String get engineFieldTheme => 'Tema';

  @override
  String get engineFieldFontSize => 'Tamanho do texto';

  @override
  String get engineFieldCodeFontSize => 'Tamanho da fonte do código';

  @override
  String get engineFieldTerminalFontSize => 'Tamanho da fonte do terminal';

  @override
  String get engineFieldTextFont => 'Fonte de texto';

  @override
  String get engineFieldCodeFont => 'Tipo de letra de código';

  @override
  String get engineFieldTerminalFont => 'Fonte do terminal';

  @override
  String get engineFieldInterfaceLanguage => 'Língua da interface';

  @override
  String get engineFieldSecondsUnit => 's';

  @override
  String get engineFieldBytesUnit => 'bytes';

  @override
  String get engineFieldGreaterThanZero => 'Superior a 0';

  @override
  String get engineFieldEnterNumeric => 'Digite um número';

  @override
  String get engineFieldEnterInteger => 'Digite um número inteiro';

  @override
  String get engineFieldInvalidFormat => 'Formato inválido';

  @override
  String get engineFieldAddress => 'Endereço';

  @override
  String get engineFieldToken => 'Token';

  @override
  String get engineFieldService => 'Serviço';

  @override
  String get engineFieldTimeout => 'Tempo- limite';

  @override
  String get engineFieldQuantity => 'Contagem';

  @override
  String get engineFieldMaxUses => 'Utilização máxima';

  @override
  String get engineFieldMaxRetries => 'Máximo de tentativas';

  @override
  String get engineFieldConcurrency => 'Concurrência';

  @override
  String get engineFieldInterval => 'Intervalo';

  @override
  String get engineFieldPrompt => 'Perguntar';

  @override
  String get engineFieldSystemPrompt => 'Promessa do sistema';

  @override
  String get engineFieldTemperature => 'Temperatura';

  @override
  String get engineFieldDebugMode => 'Modo de depuração';

  @override
  String get engineFieldVerboseLogs => 'Registros verbais';

  @override
  String get engineFieldPath => 'Localização';

  @override
  String get engineFieldCwd => 'Pasta de trabalho';

  @override
  String get engineFieldCommand => 'Comando';

  @override
  String get engineFieldArguments => 'Argumentos';

  @override
  String get engineFieldEnvironment => 'Variáveis ambientais';

  @override
  String get engineFieldHeaders => 'Cabeçalhos';

  @override
  String get engineFieldProxy => 'Proxy';

  @override
  String get engineFieldAuto => 'Automático';

  @override
  String get engineFieldEnabled => 'Activado';

  @override
  String get engineFieldOn => 'Ligado';

  @override
  String get engineFieldOff => 'Desligado';

  @override
  String get engineFieldLow => 'Baixo';

  @override
  String get engineFieldMedium => 'Médio';

  @override
  String get engineFieldHigh => 'Alta';

  @override
  String get engineFieldMax => 'Máxima';

  @override
  String get engineFieldNone => 'Nenhum';

  @override
  String get engineFieldModified => 'Modificado';

  @override
  String get engineFieldLocked => 'Corrigido pelo arquivo de configuração';

  @override
  String get engineFieldSharedWithModel => 'Compartilhado com modelos';

  @override
  String get engineFieldNotConfigured => 'Não configurado';

  @override
  String get engineFieldConfigured => 'Configurado';

  @override
  String get engineSettingsMissing => 'Esta máquina não tem tal configuração';

  @override
  String get engineSettingsPluginDisabled => 'Plug-in obrigatório não está habilitado';

  @override
  String get engineSettingsReadOnly => 'As configurações do motor são somente leitura';

  @override
  String get engineSubagentSavedUnavailable => 'Gravado, mas actualmente indisponível';

  @override
  String get engineSubagentKeepOneModel => 'Manter pelo menos um modelo';

  @override
  String get engineSubagentLimits => 'Limites';

  @override
  String get engineSubagentModelSelection => 'Selecção do modelo';

  @override
  String get engineSubagentPickFirstModel => 'Escolha um modelo para aplicar';

  @override
  String get engineSubagentReadModelsFailed => 'Não foi possível carregar modelos';

  @override
  String get engineSubagentNoModels => 'Nenhum modelo ainda disponível';

  @override
  String get engineSubagentConnectModel => 'Adicionar provedor';

  @override
  String get engineSearchDeepSeek => 'Pesquisa DeepSeek';

  @override
  String get engineSearchNewApi => 'Nova API de pesquisa';

  @override
  String get engineProviderDeleteBody =>
      'Isso exclui o provedor e sua chave API. Chats usando-o precisará de outro modelo.';

  @override
  String get engineProviderReadFailed => 'Não foi possível carregar provedores';

  @override
  String get engineProviderGone => 'Este provedor se foi.';

  @override
  String get engineProviderProtocol => 'Protocolo';

  @override
  String get engineProviderEnterKey => 'Digite a chave de API';

  @override
  String get engineProviderIssues => 'Questões';

  @override
  String get engineProviderRejectedConfig => 'O motor rejeitou algumas configurações';

  @override
  String get engineProviderConnection => 'Ligação';

  @override
  String get engineProviderDefaultUrl => 'URL padrão';

  @override
  String get engineProviderKeyNotRequired => 'Não necessário';

  @override
  String get engineProviderNoModels => 'Ainda não existem modelos';

  @override
  String get engineProviderWebConfigured => 'Configurado na Web DSH. Você pode vê-lo ou excluí-lo aqui';

  @override
  String get engineProviderDelete => 'Apagar o fornecedor';

  @override
  String get engineProviderConfigFile =>
      'Fornecido pelo arquivo de configuração do motor. Não é possível excluí-lo aqui';

  @override
  String get engineProviderTesting => 'Teste';

  @override
  String get engineProviderTestConnection => 'Conexão de teste';

  @override
  String get engineProviderKeyFirst => 'Insira uma chave de API primeiro';

  @override
  String get engineProviderNoDiscoveredModels => 'O serviço não listava modelos. Adicione-os manualmente.';

  @override
  String get engineProviderNeedModel => 'Adicionar pelo menos um modelo';

  @override
  String get engineProviderEdit => 'Editar provedor';

  @override
  String get engineProviderAdd => 'Adicionar provedor';

  @override
  String get engineProviderBasicInfo => 'Informações básicas';

  @override
  String get engineProviderNameHint => 'Por exemplo, o meu portal';

  @override
  String get engineProviderCompatibleProtocol => 'Protocolo compatível';

  @override
  String get engineProviderKeepStoredKey => 'Salvo. Deixe em branco para mantê-lo';

  @override
  String get engineProviderSaving => 'Salvando';

  @override
  String get engineProviderWaitingEngine => 'À espera do motor';

  @override
  String get engineProviderFetchingModels => 'Obtendo modelos';

  @override
  String get engineProviderFetchModels => 'Obter modelos';

  @override
  String get engineProviderAddManually => 'Adicionar manualmente';

  @override
  String get engineProviderManualModel => 'Adicionar o modelo manualmente';

  @override
  String get engineProviderModelId => 'ID do modelo';

  @override
  String get engineProviderSelectModels => 'Selecionar modelos';

  @override
  String get engineProviderSearchModels => 'Pesquisar modelos';

  @override
  String get engineProviderDeselectAll => 'Desmarcar tudo';

  @override
  String get engineProviderSelectAll => 'Selecionar todos';

  @override
  String get engineProviderNoMatchingModels => 'Sem modelos correspondentes';

  @override
  String get engineProviderAlreadyAdded => 'Adicionado';

  @override
  String get engineProviderReady => 'Pronto';

  @override
  String get engineProviderMissingKey => 'Falta a chave da API';

  @override
  String get engineProviderMisconfigured => 'Configuração inválida';

  @override
  String get engineProviderInactive => 'Não habilitado';

  @override
  String get engineProviderConfiguredInWeb => 'Configurado na Web';

  @override
  String get engineProvidersTitle => 'Modelos';

  @override
  String get engineProvidersNotConnected => 'Não ligado ao motor';

  @override
  String get engineProvidersStartEngine => 'Iniciar o motor para adicionar provedores';

  @override
  String get engineProvidersUnsupported => 'Esta máquina não suporta fornecedores personalizados';

  @override
  String get engineProvidersNotConfiguredHere => 'Não configurado nesta máquina';

  @override
  String get engineProvidersSigningIn => 'A assinar...';

  @override
  String get engineProvidersSignInOrKey => 'Iniciar sessão ou introduzir uma chave de API';

  @override
  String get engineProvidersOfficial => 'Oficial';

  @override
  String get engineProvidersSubscription => 'Assinaturas';

  @override
  String get engineProvidersCustom => 'Personalizado';

  @override
  String get engineProvidersCompatibleHint => 'Serviços compatíveis com OpenAI e Antrópicos';

  @override
  String get engineProvidersReadOnly =>
      'As configurações do motor são somente leitura. Não é possível adicionar provedores';

  @override
  String get engineSubscriptionSignOutBody => 'Seus modelos serão removidos do seletor de modelos.';

  @override
  String get engineSubscriptionNoModels => 'Sem modelos';

  @override
  String get engineSubscriptionModelsFailed => 'Não foi possível carregar modelos';

  @override
  String get engineSubscriptionPreparing => 'Preparando...';

  @override
  String get engineSubscriptionCancelled => 'Inscrição cancelada';

  @override
  String get engineSubscriptionIncomplete => 'Inclusão incompleta';

  @override
  String get engineSubscriptionWaitingSignIn => 'À espera da entrada...';

  @override
  String get engineSubscriptionReopen => 'Abrir de novo';

  @override
  String get engineSubscriptionCode => 'Código de verificação';

  @override
  String get engineSubscriptionWaitingVerification => 'À espera de verificação...';

  @override
  String get engineSubscriptionCopyCode => 'Copiar código';

  @override
  String get engineSubscriptionOpenVerification => 'Verificação aberta';

  @override
  String get engineSubscriptionPasteRedirect => 'Colar o URL redirecionado';

  @override
  String get engineSubscriptionPasteCode => 'Colar o código de autorização';

  @override
  String get engineSubscriptionPasteHere => 'Colar aqui';

  @override
  String get engineSubscriptionConfirm => 'Confirmar';

  @override
  String get engineSubscriptionTryAgain => 'Tente novamente.';

  @override
  String engineAccountWelcome(String name) {
    return 'Bem-vindo. $name';
  }

  @override
  String engineLayerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count níveis', one: '1 nível');
    return '$_temp0';
  }

  @override
  String engineFieldDefaultValue(String value) {
    return 'Padrão $value';
  }

  @override
  String engineFieldDefaultValueUnit(String value, String unit) {
    return 'Padrão $value $unit';
  }

  @override
  String engineFieldCurrentValue(String value) {
    return 'Atual $value';
  }

  @override
  String engineFieldRemoveItem(String name) {
    return 'Remover $name';
  }

  @override
  String engineFieldAddItem(String item) {
    return 'Adicionar $item';
  }

  @override
  String engineFieldItemIndex(int index) {
    return 'Item $index';
  }

  @override
  String engineFieldByteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count bytes', one: '1 byte');
    return '$_temp0';
  }

  @override
  String engineFieldHours(String value) {
    return '$value h';
  }

  @override
  String engineFieldMinutes(String value) {
    return '$value min';
  }

  @override
  String engineFieldSeconds(String value) {
    return '$value s';
  }

  @override
  String engineFieldMilliseconds(String value) {
    return '$value ms';
  }

  @override
  String engineFieldPositiveMax(String max) {
    return 'Superior a 0, até $max';
  }

  @override
  String engineFieldMin(String min) {
    return 'Pelo menos $min';
  }

  @override
  String engineFieldMaxBound(String max) {
    return 'No máximo $max';
  }

  @override
  String engineFieldBelowMin(String min) {
    return 'Deve ser pelo menos $min';
  }

  @override
  String engineFieldAboveMax(String max) {
    return 'Deve ser no máximo $max';
  }

  @override
  String engineFieldMultiple(String step) {
    return 'Deve ser um múltiplo de $step';
  }

  @override
  String engineFieldMinCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pelo menos $count caracteres',
      one: 'Pelo menos 1 caractere',
    );
    return '$_temp0';
  }

  @override
  String engineFieldMaxCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'No máximo $count caracteres',
      one: 'No máximo 1 caracter',
    );
    return '$_temp0';
  }

  @override
  String engineSubagentUnavailableProvider(String provider) {
    return '$provider · Atualmente indisponível';
  }

  @override
  String engineProviderDeleteTitle(String name) {
    return 'Apagar “$name”?';
  }

  @override
  String engineProviderDeleteFailed(String error) {
    return 'Não foi possível excluir: $error';
  }

  @override
  String engineProviderModelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Modelos · $count', one: 'Modelo · 1');
    return '$_temp0';
  }

  @override
  String engineProviderContext(String size) {
    return 'Contexto $size';
  }

  @override
  String engineProviderTestPassed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Conectado · Listado $count modelos',
      one: 'Conectado · Listado 1 modelo',
    );
    return '$_temp0';
  }

  @override
  String engineProviderCompletedUrl(String url) {
    return 'Concluído como $url';
  }

  @override
  String engineProviderSaveFailed(String error) {
    return 'Não foi possível salvar: $error';
  }

  @override
  String engineProviderCandidateCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count total', one: '1 total');
    return '$_temp0';
  }

  @override
  String engineProviderAddModels(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Adicionar $count modelos',
      one: 'Adicionar 1 modelo',
    );
    return '$_temp0';
  }

  @override
  String engineProviderModels(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count modelos', one: '1 modelo');
    return '$_temp0';
  }

  @override
  String engineProvidersSummary(int total, int ready) {
    String _temp0 = intl.Intl.pluralLogic(total, locale: localeName, other: '$total provedores', one: '1 provedor');
    return '$_temp0 · $ready pronto';
  }

  @override
  String engineProvidersAccount(String name) {
    return 'Conta · $name';
  }

  @override
  String engineProvidersSignedInAccount(String account) {
    return 'Assinado em · $account';
  }

  @override
  String engineSubscriptionSignIn(String provider) {
    return 'Iniciar sessão em $provider';
  }

  @override
  String engineSubscriptionSignOutTitle(String provider) {
    return 'Sair $provider?';
  }

  @override
  String engineSubscriptionSignOutFailed(String error) {
    return 'Não foi possível assinar: $error';
  }

  @override
  String engineSubscriptionCodeSemantics(String code) {
    return 'Código de verificação $code';
  }

  @override
  String engineFieldItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count itens', one: '1 ponto');
    return '$_temp0';
  }

  @override
  String engineFieldUseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count vezes', one: '1 vez');
    return '$_temp0';
  }

  @override
  String engineFieldResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count resultados', one: '1 resultado');
    return '$_temp0';
  }

  @override
  String engineFieldMinCharactersDecimal(String bound) {
    return 'Pelo menos $bound caracteres';
  }

  @override
  String engineFieldMaxCharactersDecimal(String bound) {
    return 'No máximo $bound caracteres';
  }

  @override
  String engineLayerValue(String value) {
    return '$value níveis';
  }

  @override
  String engineFieldEnterPositiveRange(String max) {
    return 'Indique um número superior a 0 e não superior a $max';
  }

  @override
  String engineFieldEnterBoundedRange(String min, String max) {
    return 'Digite um número de $min para $max';
  }

  @override
  String get engineModelTokenLimits => 'Limites dos dados';

  @override
  String get engineModelContextLength => 'Comprimento do contexto';

  @override
  String get engineModelMaxOutput => 'Saída máxima';

  @override
  String engineModelDefaultSize(String size) {
    return 'Padrão $size';
  }

  @override
  String get engineModelCapabilities => 'Capacidades';

  @override
  String get engineModelInputType => 'Entrada';

  @override
  String get engineModelInputText => 'Texto';

  @override
  String get engineModelInputTextImage => 'Texto + imagem';

  @override
  String get engineModelThinking => 'Pensar';

  @override
  String get engineModelVision => 'Visão';

  @override
  String get engineModelLevels => 'Níveis disponíveis';

  @override
  String get engineModelNeedLevel => 'Escolha pelo menos um nível';

  @override
  String get engineFieldEditOnWeb => 'Editar este item na Web';

  @override
  String get engineSettingsHostChanged => 'O hospedeiro mudou. Reabrir estas configurações para editar.';

  @override
  String get engineSecretTargetChanged => 'Este campo mudou. Reabrir para editar.';

  @override
  String engineSettingsGroupCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count configurações', one: '1 ajuste');
    return '$_temp0';
  }

  @override
  String get featuresCordisSubtitle => 'Plugins dinâmicos · Limpado quando o motor reinicia';

  @override
  String get featuresCordisUnavailable => 'Cordis não está disponível aqui';

  @override
  String get featuresCordisRemoteUnavailable => 'Indisponível sobre o DSH Remote';

  @override
  String get featuresCordisReadFailed => 'Não foi possível carregar plugins';

  @override
  String get featuresCordisEmpty => 'Nenhum plug- in dinâmico ainda';

  @override
  String get featuresCordisEmptyHint => 'Os \'plugins\' aparecem aqui uma vez criados';

  @override
  String get featuresCurrentChat => 'Conversa atual';

  @override
  String get featuresOtherChats => 'Outras conversas';

  @override
  String featuresPresetDefaultSet(String name) {
    return 'Novos chats usarão “$name”';
  }

  @override
  String get featuresPresetDefaultFailed => 'Não foi possível definir como padrão';

  @override
  String featuresPresetDeleteTitle(String name) {
    return 'Apagar “$name”?';
  }

  @override
  String get featuresPresetDeleteHint =>
      'Não estará disponível para novos chats. Os chats existentes ficam como estão.';

  @override
  String get featuresDeleted => 'Removido';

  @override
  String get featuresDeleteFailed => 'Não foi possível apagar';

  @override
  String get featuresPresetAlreadyDefault => 'Padrão para novas conversas';

  @override
  String get featuresPresetSetDefault => 'Usar para novas conversas';

  @override
  String get featuresPresetViewConfig => 'Ver a configuração';

  @override
  String get featuresPresetDuplicate => 'Duplicar a predefinição';

  @override
  String get featuresPresetDefaultDeleteHint =>
      'Definir outra predefinição como o padrão para novas conversas primeiro';

  @override
  String get featuresAgentPresets => 'Predefinições do agente';

  @override
  String get featuresAgentPresetsSubtitle => 'Ferramentas e comportamento para novos chats';

  @override
  String get featuresNew => 'Novo';

  @override
  String get featuresPresetsReadFailed => 'Não foi possível carregar as predefinições do agente';

  @override
  String get featuresLoadFailed => 'Não foi possível carregar';

  @override
  String get featuresNewChatDefault => 'Padrão para novas conversas';

  @override
  String get featuresEmptyDocument => '(Esvaziado)';

  @override
  String get featuresReadFailed => 'Não foi possível ler';

  @override
  String featuresTodayTime(String time) {
    return 'Hoje $time';
  }

  @override
  String featuresTomorrowTime(String time) {
    return 'Amanhã. $time';
  }

  @override
  String featuresYesterdayTime(String time) {
    return 'Ontem $time';
  }

  @override
  String featuresScheduleSummaryNext(String rule, String time) {
    return '$rule · Próxima $time';
  }

  @override
  String get featuresEnded => 'Terminado';

  @override
  String featuresScheduleSummaryEnded(String time) {
    return 'Terminado · Ran $time';
  }

  @override
  String featuresJobElapsed(String span) {
    return 'Executar para $span';
  }

  @override
  String featuresJobDuration(String span) {
    return 'Levado $span';
  }

  @override
  String get featuresPermissionReadOnly => 'Apenas leitura';

  @override
  String get featuresPermissionWorkspaceWrite => 'Editar arquivos';

  @override
  String get featuresPermissionFullAccess => 'Acesso completo';

  @override
  String get featuresPermissionAutoReview => 'Revisão automática';

  @override
  String get featuresPermissionCustom => 'Personalizado';

  @override
  String get featuresPermissionReadOnlyHint => 'Ver os arquivos sem os alterar';

  @override
  String get featuresPermissionWorkspaceWriteHint =>
      'Editar os arquivos da área de trabalho; pergunte antes de ir além';

  @override
  String get featuresPermissionFullAccessHint => 'Correr sem perguntar';

  @override
  String get featuresPermissionAutoReviewHint => 'O modelo revisa cada ação e pergunta quando está inseguro';

  @override
  String get featuresPresetStandard => 'Modo padrão';

  @override
  String get featuresPresetPtc => 'Modo PTC';

  @override
  String get featuresPresetMinimal => 'Modo mínimo';

  @override
  String get featuresPresetCreator => 'Modo criador';

  @override
  String get featuresPresetStandardDescription => 'Código, arquivos e pesquisa para a maioria das tarefas';

  @override
  String get featuresPresetPtcDescription => 'Chamadas de ferramentas em lote, filtrar, analisar e resumir';

  @override
  String get featuresPresetMinimalDescription => 'Apenas visualização de terminal e imagem, para teste e comparação';

  @override
  String get featuresPresetCreatorDescription => 'Faça com que o agente escreva plugins para personalizar o DSH';

  @override
  String featuresHostUnreachable(String name) {
    return 'Não é possível conectar a “$name”';
  }

  @override
  String featuresHostConnecting(String name) {
    return 'Conectando a “$name”…';
  }

  @override
  String get featuresJobs => 'Trabalhos de base';

  @override
  String get featuresJobsSubtitle => 'Limpar quando o motor reiniciar';

  @override
  String get featuresJobsReadFailed => 'Não foi possível carregar tarefas de fundo';

  @override
  String get featuresJobsEmpty => 'Sem tarefas de fundo';

  @override
  String get featuresJobsEmptyHint => 'Comandos como servidores dev aparecem aqui';

  @override
  String featuresJobsEndedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Terminado · $count', one: 'Terminado · 1');
    return '$_temp0';
  }

  @override
  String get featuresJobStopTitle => 'Parar este trabalho?';

  @override
  String get featuresJobAlreadyEnded => 'Este trabalho já terminou';

  @override
  String get featuresJobStopFailed => 'Não foi possível parar';

  @override
  String get featuresJobOutput => 'Resultado da tarefa';

  @override
  String get featuresOutput => 'Saída';

  @override
  String featuresJobRecentLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Último $count linhas',
      one: 'Última 1 linha',
    );
    return '$_temp0';
  }

  @override
  String get featuresJobOutputSubject => 'Saída da tarefa DSH';

  @override
  String get featuresJobOutputReadFailed => 'Não foi possível ler o resultado';

  @override
  String get featuresJobOutputWaiting => 'À espera da saída...';

  @override
  String get featuresJobOutputEmpty => 'Sem saída';

  @override
  String get featuresPermissionAutoTitle => 'Ligar a revisão automática?';

  @override
  String get featuresPermissionAutoWarning => 'O modelo decide se permite cada ação. Pode errar.';

  @override
  String get featuresSwitchFailed => 'Não foi possível mudar';

  @override
  String get featuresPermissions => 'Permissões';

  @override
  String get featuresPermissionsSubtitle => 'Escolha quando perguntar antes de executar comandos ou editar arquivos';

  @override
  String get featuresPermissionsReadFailed => 'Não foi possível carregar permissões';

  @override
  String get featuresPermissionCustomHint => 'Escolher uma predefinição substitui as suas permissões personalizadas';

  @override
  String get featuresModuleInstructions => 'Instruções do espaço de trabalho';

  @override
  String get featuresModuleTime => 'Sensibilização do tempo';

  @override
  String get featuresModuleBash => 'Ferramenta de comando Bash';

  @override
  String get featuresModulePersistentBash => 'Ferramenta Bash persistente';

  @override
  String get featuresModulePowerShell => 'Ferramenta de comando PowerShell';

  @override
  String get featuresModuleFiles => 'Ferramenta de leitura/escrita de arquivos';

  @override
  String get featuresModuleFileSearch => 'Ferramenta de pesquisa de arquivos';

  @override
  String get featuresModuleJobs => 'Ferramenta de trabalho de fundo';

  @override
  String get featuresModuleSchedule => 'Ferramenta de automação';

  @override
  String get featuresModuleLocalSkills => 'Carregamento de competências local';

  @override
  String get featuresModuleSkillTool => 'Ferramenta de carregamento de competências';

  @override
  String get featuresModuleGoalCommand => 'Comando de gestão de objectivos';

  @override
  String get featuresModuleGoalTool => 'Ferramenta de gestão de objectivos';

  @override
  String get featuresModulePlan => 'Modo de plano';

  @override
  String get featuresModuleCompaction => 'Compactação de contexto';

  @override
  String get featuresModuleCompactCommand => 'Comando de compactação de contexto';

  @override
  String get featuresModuleAskUser => 'Perguntar à ferramenta do usuário';

  @override
  String get featuresModuleTodo => 'Ferramenta de lista de tarefas';

  @override
  String get featuresModuleWeb => 'Ferramenta de pesquisa e busca na Web';

  @override
  String get featuresModulePresent => 'Ferramenta de entrega de arquivos';

  @override
  String get featuresModuleCordis => 'Ferramenta de pesquisa de API de plug-in';

  @override
  String get featuresModuleSubagent => 'Instrumento de delegação de agentes';

  @override
  String get featuresModuleSubagentControl => 'Ferramenta de controle de subagentes';

  @override
  String get featuresModuleWorkflow => 'Ferramenta de fluxo de trabalho';

  @override
  String get featuresModulePluginManager => 'Ferramenta de gerenciamento de plug-ins';

  @override
  String get featuresModulePluginMarket => 'Ferramenta de mercado de plug-ins';

  @override
  String get featuresModuleToolCalls => 'Estilo de chamada de ferramentas';

  @override
  String get featuresModuleTerminal => 'Serviço de terminal persistente';

  @override
  String get featuresModulePersona => 'Agente persona';

  @override
  String get featuresGroupDelegation => 'Delegação Subagente';

  @override
  String get featuresGroupTerminal => 'Terminal persistente';

  @override
  String get featuresPresetIdRequired => 'Digite um ID';

  @override
  String get featuresPresetIdLength => 'Até 40 caracteres';

  @override
  String get featuresPresetIdFormat => 'Use letras minúsculas, números e hífens';

  @override
  String get featuresPresetIdTaken => 'Este ID já está em uso';

  @override
  String featuresPresetCopyName(String name) {
    return '$name cópia';
  }

  @override
  String get featuresPresetBasedOn => 'Baseado em';

  @override
  String get featuresNameRequired => 'Digite um nome';

  @override
  String get featuresCreatorOpenFailed => 'Não foi possível abrir o modo Criador';

  @override
  String get featuresPresetNameHint => 'Por exemplo: Code review';

  @override
  String get featuresPresetId => 'ID';

  @override
  String get featuresPresetIdHint => 'Letras minúsculas, números e hífens';

  @override
  String get featuresPresetDescription => 'Designação das mercadorias';

  @override
  String get featuresPresetDescriptionHint => 'Descreva para que serve em uma frase';

  @override
  String get featuresPresetConfigReadFailed => 'Não foi possível carregar a configuração predefinida';

  @override
  String get featuresPresetCreateTitle => 'Nova predefinição do agente';

  @override
  String get featuresPresetDuplicateTitle => 'Predefinição do agente duplicado';

  @override
  String get featuresPresetEditTitle => 'Editar a predefinição do agente';

  @override
  String get featuresCreatorOpening => 'Abrir o modo Criador';

  @override
  String get featuresWaitingEngine => 'À espera do motor';

  @override
  String get featuresCreatorUnavailable => 'Modo criador indisponível';

  @override
  String get featuresPresetStartUpdate => 'Iniciar a atualização';

  @override
  String get featuresPresetStartCreate => 'Iniciar a criação';

  @override
  String get featuresPresetSystemPrompt => 'Promessa do sistema';

  @override
  String get featuresPresetSystemPromptHint => 'Quem és e como trabalhas';

  @override
  String get featuresPresetReplaceSystemPrompt => 'Substituir o prompt completo do sistema';

  @override
  String get featuresPresetTools => 'Ferramentas';

  @override
  String get featuresSkills => 'Habilidades';

  @override
  String get featuresPresetContextModes => 'Contexto e modos';

  @override
  String get featuresCronMinute => 'Ata';

  @override
  String get featuresCronHour => 'Horas';

  @override
  String get featuresDate => 'Data';

  @override
  String get featuresCronMonth => 'Mês';

  @override
  String get featuresCronWeekday => 'Dia da semana';

  @override
  String get featuresCronRequired => 'Digite uma expressão Cron de 5 campos';

  @override
  String get featuresCronWhitespace => 'Sem espaços iniciais ou finais';

  @override
  String featuresCronFieldCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Esperado 5 campos, tenho $count',
      one: 'Esperado 5 campos, tenho 1',
    );
    return '$_temp0';
  }

  @override
  String featuresCronInvalidField(int index, String name) {
    return 'Campo $index ($name) é inválido';
  }

  @override
  String get featuresWeekdayMon => 'Seg';

  @override
  String get featuresWeekdayTue => 'Ter';

  @override
  String get featuresWeekdayWed => 'Qua';

  @override
  String get featuresWeekdayThu => 'Qui';

  @override
  String get featuresWeekdayFri => 'Sex';

  @override
  String get featuresWeekdaySat => 'Sáb';

  @override
  String get featuresWeekdaySun => 'Dom';

  @override
  String get featuresMonthJan => 'Janeiro';

  @override
  String get featuresMonthFeb => 'Fevereiro';

  @override
  String get featuresMonthMar => 'Março';

  @override
  String get featuresMonthApr => 'Abril';

  @override
  String get featuresMonthMay => 'Maio';

  @override
  String get featuresMonthJun => 'Junho';

  @override
  String get featuresMonthJul => 'Julho';

  @override
  String get featuresMonthAug => 'Agosto';

  @override
  String get featuresMonthSep => 'Setembro';

  @override
  String get featuresMonthOct => 'Outubro';

  @override
  String get featuresMonthNov => 'Novembro';

  @override
  String get featuresMonthDec => 'Dezembro';

  @override
  String featuresWeekdayName(String day) {
    return '$day';
  }

  @override
  String featuresCronWeekdayRange(String first, String last) {
    return '$first–$last';
  }

  @override
  String featuresCronEveryDay(String months) {
    return 'Todos os dias$months';
  }

  @override
  String featuresCronMonthDays(String days, String months) {
    return 'Mensal em $days$months';
  }

  @override
  String featuresCronMonthDaysAndWeekdays(String days, String weekdays, String months) {
    return 'Mensal em $days, se $weekdays$months';
  }

  @override
  String featuresCronMonthDaysOrWeekdays(String days, String weekdays, String months) {
    return 'Mensal em $days ou $weekdays$months';
  }

  @override
  String featuresCronHourRange(String first, String last) {
    return '$first para $last';
  }

  @override
  String get featuresEveryMinute => 'A cada minuto';

  @override
  String featuresCronEveryMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cada $count minutos',
      one: 'A cada minuto',
    );
    return '$_temp0';
  }

  @override
  String get featuresEveryHour => 'A cada hora';

  @override
  String featuresCronHourlyMinutes(String minutes) {
    return 'No minuto $minutes de cada hora';
  }

  @override
  String featuresCronHoursEveryMinute(String hours) {
    return 'Cada minuto durante a hora $hours';
  }

  @override
  String featuresCronHoursEveryMinutes(String hours, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cada $count minutos durante a hora $hours',
      one: 'Cada minuto durante a hora $hours',
    );
    return '$_temp0';
  }

  @override
  String featuresCronEveryHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Cada $count horas', one: 'A cada hora');
    return '$_temp0';
  }

  @override
  String featuresCronHoursMinutes(String hours, String minutes) {
    return 'No minuto $minutes durante a hora $hours';
  }

  @override
  String get featuresRepeatDaily => 'Diariamente';

  @override
  String get featuresRepeatWeekdays => 'Semanais';

  @override
  String get featuresRepeatWeekly => 'Semanal';

  @override
  String get featuresRepeatMonthly => 'Mensal';

  @override
  String get featuresRepeatInterval => 'Intervalo';

  @override
  String get featuresRepeatOnce => 'Uma vez';

  @override
  String get featuresRepeatAdvanced => 'Avançado';

  @override
  String get featuresIntervalSeconds => 'Segundos';

  @override
  String get featuresZoneUnavailable => 'Fuso horário indisponível';

  @override
  String get featuresChooseDay => 'Escolha pelo menos um dia';

  @override
  String get featuresIntervalMinimum => 'Intervalo deve ser pelo menos 1';

  @override
  String get featuresMinimumMinute => 'Pelo menos 1 minuto';

  @override
  String get featuresTimeDoesNotExist => 'Este tempo não existe neste fuso horário';

  @override
  String get featuresChooseFutureTime => 'Escolha uma hora futura';

  @override
  String get featuresCronNeverRuns => 'Esta expressão nunca é executada';

  @override
  String featuresRuleDaily(String time) {
    return 'Diariamente em $time';
  }

  @override
  String featuresRuleWeekdays(String time) {
    return 'Semanais $time';
  }

  @override
  String featuresRuleWeekends(String time) {
    return 'Fim de semana em $time';
  }

  @override
  String featuresRuleWeekly(String days, String time) {
    return 'Cada $days em $time';
  }

  @override
  String featuresRuleMonthly(String days, String time) {
    return 'Mensal em $days em $time';
  }

  @override
  String get featuresRepeat => 'Repetir';

  @override
  String get featuresChat => 'Conversar';

  @override
  String get featuresWorkspace => 'Espaço de trabalho';

  @override
  String get featuresInstructionRequired => 'Digite instruções';

  @override
  String featuresScheduleSaveError(String reason) {
    return 'Não foi possível salvar: $reason';
  }

  @override
  String featuresScheduleCreateError(String reason) {
    return 'Não foi possível criar: $reason';
  }

  @override
  String get featuresScheduleNameHint => 'Por exemplo: medicine';

  @override
  String get featuresScheduleInstruction => 'Instruções';

  @override
  String get featuresScheduleInstructionHint => 'Por exemplo: Resuma os commits de ontem para mim';

  @override
  String get featuresScheduleRunTime => 'Tempo de execução';

  @override
  String get featuresScheduleOpenChat => 'Ver chat';

  @override
  String get featuresScheduleEditTitle => 'Editar a automação';

  @override
  String get featuresScheduleCreateTitle => 'Nova automação';

  @override
  String get featuresScheduleSaving => 'Salvando';

  @override
  String get featuresScheduleCreating => 'Criando em chat';

  @override
  String get featuresTime => 'Tempo';

  @override
  String get featuresNotSelected => 'Não selecionado';

  @override
  String featuresMonthDaysLabel(String days) {
    return 'Dia $days';
  }

  @override
  String get featuresTimeZone => 'Fuso horário';

  @override
  String get featuresScheduleRunLocation => 'Correr para dentro';

  @override
  String get featuresJustCreatedChat => 'Conversa criada há pouco';

  @override
  String get featuresModel => 'Modelo';

  @override
  String get featuresRequestRefused => 'O motor não aceitou este pedido';

  @override
  String get featuresScheduleNotFound => 'Esta automação já não existe';

  @override
  String get featuresScheduleEndedError => 'Esta automação terminou e não pode ser editada';

  @override
  String get featuresScheduleConflict => 'Esta automação acabou de mudar. Volta e tente novamente.';

  @override
  String get featuresScheduleInvalidPrompt => 'Digite um nome e instruções. Nomes podem ter até 120 caracteres.';

  @override
  String get featuresScheduleInvalidTime => 'Tempo de execução inválido';

  @override
  String get featuresScheduleIntervalTooShort => 'Intervalo deve ser de pelo menos 1 minuto';

  @override
  String get featuresScheduleTimeOutOfRange => 'O tempo está fora de alcance';

  @override
  String get featuresScheduleSubagentError => 'Este chat não pode receber automações';

  @override
  String get featuresEvery => 'Cada';

  @override
  String get featuresCronExpression => 'Expressão de Cron';

  @override
  String get featuresCronFieldGuide => 'Min hora dia mês semana';

  @override
  String featuresZoneTimeSuffix(String city) {
    return ' ($city tempo)';
  }

  @override
  String get featuresScheduleNextLocal => 'Próxima execução (tempo deste celular)';

  @override
  String get featuresScheduleNext => 'Próximas execuções';

  @override
  String featuresMonthDayChoice(int day) {
    return 'Dia $day';
  }

  @override
  String get featuresZonesCommon => 'Frequentes';

  @override
  String get featuresZonesAll => 'Tudo';

  @override
  String get featuresZoneSearchHint => 'Procurar cidades, fusos horários ou deslocamentos UTC';

  @override
  String get featuresZonesNoMatch => 'Sem fusos horários correspondentes';

  @override
  String get featuresZoneUTC => 'Tempo universal coordenado';

  @override
  String get featuresZoneShanghai => 'Xangai';

  @override
  String get featuresZoneUrumqi => 'Urumqi';

  @override
  String get featuresZoneHongKong => 'Hong Kong';

  @override
  String get featuresZoneMacau => 'Macau';

  @override
  String get featuresZoneTaipei => 'Taipei';

  @override
  String get featuresZoneTokyo => 'Tóquio';

  @override
  String get featuresZoneSeoul => 'Seul';

  @override
  String get featuresZoneSingapore => 'Singapura';

  @override
  String get featuresZoneKualaLumpur => 'Kuala Lumpur';

  @override
  String get featuresZoneBangkok => 'Bangkok';

  @override
  String get featuresZoneHoChiMinh => 'Cidade de Ho Chi Minh';

  @override
  String get featuresZoneJakarta => 'Jacarta';

  @override
  String get featuresZoneManila => 'Manila';

  @override
  String get featuresZoneKolkata => 'Kolkata';

  @override
  String get featuresZoneDubai => 'Dubai';

  @override
  String get featuresZoneJerusalem => 'Jerusalém';

  @override
  String get featuresZoneLondon => 'Londres';

  @override
  String get featuresZoneDublin => 'Dublin';

  @override
  String get featuresZoneLisbon => 'Lisboa';

  @override
  String get featuresZoneParis => 'Paris';

  @override
  String get featuresZoneBerlin => 'Berlim';

  @override
  String get featuresZoneMadrid => 'Madrid';

  @override
  String get featuresZoneRome => 'Roma';

  @override
  String get featuresZoneAmsterdam => 'Amesterdão';

  @override
  String get featuresZoneZurich => 'Zurique';

  @override
  String get featuresZoneStockholm => 'Estocolmo';

  @override
  String get featuresZoneWarsaw => 'Varsóvia';

  @override
  String get featuresZoneAthens => 'Atenas';

  @override
  String get featuresZoneIstanbul => 'Istambul';

  @override
  String get featuresZoneMoscow => 'Moscovo';

  @override
  String get featuresZoneCairo => 'Cairo';

  @override
  String get featuresZoneJohannesburg => 'Joanesburgo';

  @override
  String get featuresZoneLagos => 'Lagos';

  @override
  String get featuresZoneNewYork => 'Nova Iorque';

  @override
  String get featuresZoneToronto => 'Toronto';

  @override
  String get featuresZoneChicago => 'Chicago';

  @override
  String get featuresZoneDenver => 'Denver';

  @override
  String get featuresZonePhoenix => 'Phoenix';

  @override
  String get featuresZoneLosAngeles => 'Los Angeles';

  @override
  String get featuresZoneVancouver => 'Vancouver';

  @override
  String get featuresZoneAnchorage => 'Fixação';

  @override
  String get featuresZoneMexicoCity => 'Cidade do México';

  @override
  String get featuresZoneBogota => 'Bogotá';

  @override
  String get featuresZoneLima => 'Lima';

  @override
  String get featuresZoneSantiago => 'Santiago';

  @override
  String get featuresZoneSaoPaulo => 'São Paulo';

  @override
  String get featuresZoneBuenosAires => 'Buenos Aires';

  @override
  String get featuresZoneHonolulu => 'Honolulu';

  @override
  String get featuresZoneAuckland => 'Auckland';

  @override
  String get featuresZoneSydney => 'Sydney';

  @override
  String get featuresZoneMelbourne => 'Melbourne';

  @override
  String get featuresZoneBrisbane => 'Brisbane';

  @override
  String get featuresZonePerth => 'Perth';

  @override
  String get featuresScheduleCreated => 'Criado';

  @override
  String get featuresSchedulesReadFailed => 'Não foi possível carregar automações';

  @override
  String get featuresSchedulesEmpty => 'Sem automações ainda';

  @override
  String get featuresSchedulesEmptyHint => 'Enviar para uma conversa e executar automaticamente na hora agendada';

  @override
  String get featuresScheduleNewTask => 'Nova automação';

  @override
  String get featuresSchedulesNoMatch => 'Sem automações correspondentes';

  @override
  String get featuresSchedulesNoActive => 'Sem automação ativa';

  @override
  String get featuresSchedulesNoEnded => 'Sem automações terminadas';

  @override
  String get featuresSchedules => 'Automação';

  @override
  String get featuresSchedulesSubtitle => 'Enviar para o chat original na hora agendada';

  @override
  String get featuresSchedulesSearch => 'Automações de pesquisa';

  @override
  String featuresSchedulesAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Tudo $count', one: 'Todos 1');
    return '$_temp0';
  }

  @override
  String get featuresScheduleUntitled => 'Automação sem título';

  @override
  String get featuresScheduleSent => 'Enviado para chat';

  @override
  String get featuresView => 'Ver';

  @override
  String get featuresSendFailed => 'Não foi possível enviar';

  @override
  String get featuresScheduleDeleteTitle => 'Apagar esta automação?';

  @override
  String get featuresScheduleDeleteHint =>
      'Future runs irá parar e executar o histórico será excluído. A conversa original fica como está.';

  @override
  String get featuresScheduleDeleted => 'Automação apagada';

  @override
  String get featuresScheduleActive => 'Ativo';

  @override
  String get featuresScheduleRun => 'Executar';

  @override
  String get featuresScheduleNextRun => 'Próxima';

  @override
  String get featuresScheduleLastRun => 'Último';

  @override
  String get featuresScheduleRule => 'Regra';

  @override
  String get featuresScheduleLinkedChat => 'Conversa em ligação';

  @override
  String get featuresScheduleChatDeleted => 'Conversar apagada';

  @override
  String get featuresScheduleEdit => 'Editar a automação';

  @override
  String get featuresScheduleRunNow => 'Corre agora.';

  @override
  String get featuresScheduleHistory => 'Executar o histórico';

  @override
  String get featuresScheduleNeverRun => 'Nenhuma execução ainda';

  @override
  String get featuresScheduleHistoryUnavailable => 'Histórico não disponível';

  @override
  String get featuresScheduleHistoryReadFailed => 'Não foi possível carregar o histórico de execução';

  @override
  String get featuresScheduleDelete => 'Apagar a automação';

  @override
  String featuresExportSavedTo(String path) {
    return 'Gravado em $path';
  }

  @override
  String get featuresExportTitle => 'Exportar os registros de chat';

  @override
  String get featuresExportSubtitle => 'Um ZIP para feedback ou backup';

  @override
  String get featuresExportUnavailable => 'Não é possível exportar sobre esta conexão';

  @override
  String get featuresExportRemoteHint =>
      'Os logs não estão disponíveis no DSH Remote. Exporta-os do DSH Web no seu computador.';

  @override
  String get featuresExportShareHint => 'Anexar ao feedback ou enviar para si mesmo';

  @override
  String get featuresExportSaveDownloads => 'Gravar em Downloads';

  @override
  String get featuresExportDownloadsHint => 'Salvar em Downloads/DSH-Go';

  @override
  String get featuresExportContents => 'Todos os registros e anexos deste chat e dos seus agentes';

  @override
  String get featuresSkillUseHere => 'Usar no chat';

  @override
  String get featuresSkillUseNew => 'Nova conversa';

  @override
  String get featuresSkillsCallHint => 'Tipo/nome de habilidade a usar';

  @override
  String get featuresSkillsReadFailed => 'Não foi possível carregar habilidades';

  @override
  String get featuresSkillsEmpty => 'Nenhuma habilidade nesta conversa ainda';

  @override
  String get featuresSkillsEmptyHint => 'Habilidades em .dsh/skills aparecem aqui';

  @override
  String get featuresSkillsSourceHint => 'A partir do projeto e ~ /.dsh pastas de habilidades';

  @override
  String featuresSkillUsage(String usage) {
    return 'Em vez de: $usage';
  }

  @override
  String get featuresSkillManual => 'Apenas manual';

  @override
  String featuresArtifactsSemantic(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Arquivos de saída, $count arquivos, ver todos',
      one: 'Arquivos de saída, 1 arquivo, ver todos',
    );
    return '$_temp0';
  }

  @override
  String get featuresArtifactsTitle => 'Arquivos de saída';

  @override
  String featuresArtifactsAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Tudo $count', one: 'Todos 1');
    return '$_temp0';
  }

  @override
  String featuresArtifactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count arquivos', one: '1 arquivo');
    return '$_temp0';
  }

  @override
  String get featuresArtifactsNoFiles => 'Nenhum arquivo ainda';

  @override
  String featuresArtifactsTotal(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos · Entregue e gerada',
      one: '1 arquivo · Entregue e gerado',
    );
    return '$_temp0';
  }

  @override
  String get featuresArtifactsEmpty => 'Nenhum arquivo de saída ainda';

  @override
  String get featuresArtifactsEmptyHint => 'Os arquivos entregues ou gerados por IA aparecem aqui';

  @override
  String get featuresListSeparator => ', ';

  @override
  String featuresErrorReason(String title, String reason) {
    return '$title: $reason';
  }

  @override
  String featuresYearDate(int year, String date) {
    return '$date, $year';
  }

  @override
  String featuresDateWeekdayTime(String date, String week, String time) {
    return '$week, $date $time';
  }

  @override
  String featuresDateWeekday(String date, String day) {
    return '$day, $date';
  }

  @override
  String featuresOnceDescription(String rule, String date, String time) {
    return '$rule · $date $time';
  }

  @override
  String featuresCronMonthSuffix(String months) {
    return ' ($months)';
  }

  @override
  String featuresRuleIntervalSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cada $count segundos',
      one: 'A cada segundo',
    );
    return '$_temp0';
  }

  @override
  String featuresRuleIntervalMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cada $count minutos',
      one: 'A cada minuto',
    );
    return '$_temp0';
  }

  @override
  String featuresRuleIntervalHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Cada $count horas', one: 'A cada hora');
    return '$_temp0';
  }

  @override
  String featuresSchedulesActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Ativo $count', one: 'Ativo 1');
    return '$_temp0';
  }

  @override
  String featuresSchedulesEndedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Terminado $count', one: 'Terminado 1');
    return '$_temp0';
  }

  @override
  String featuresScheduleRetention(int days, int count) {
    String _temp0 = intl.Intl.pluralLogic(days, locale: localeName, other: 'Último $days dias', one: 'Último 1 dia');
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'até $count entradas',
      one: 'até 1 entrada',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String featuresScheduleRetentionUnknown(int days) {
    String _temp0 = intl.Intl.pluralLogic(days, locale: localeName, other: 'Último $days dias', one: 'Último 1 dia');
    return '$_temp0, limite de entrada indisponível';
  }

  @override
  String featuresArtifactsDeliveredTurn(int turn) {
    return 'Virar $turn · Entregue';
  }

  @override
  String featuresArtifactsGeneratedTurn(int turn) {
    return 'Virar $turn · Gerado';
  }

  @override
  String featuresPresetCreateRequest(String name, String id, String directory) {
    return 'Crie a predefinição do agente “$name” ($id): escreva estes dois arquivos exatamente como fornecidos no espaço de trabalho e, em seguida, use plugin_manager e install_bundle para instalar o diretório `$directory`. Faça somente isso.\n\n';
  }

  @override
  String featuresPresetUpdateRequest(String name, String id, String replacing, String directory) {
    return 'Atualize a predefinição do agente “$name” ($id): escreva estes dois arquivos exatamente como fornecidos no espaço de trabalho. Use plugin_manager para remover o pacote `$replacing` e install_bundle para instalar o diretório `$directory`. Faça somente isso.\n\n';
  }

  @override
  String featuresZoneThisPhone(String city) {
    return '$city · Este celular';
  }

  @override
  String get featuresPermissionResetHint => 'O padrão do novo conversa não é mais válido';

  @override
  String get featuresPermissionResetDefault => 'Restaurar padrão';

  @override
  String get fileImageName => 'imagem';

  @override
  String get fileSharedText => 'Texto compartilhado.txt';

  @override
  String get fileChatFallback => 'chat';

  @override
  String get hubSessionDetails => 'Detalhes da conversa';

  @override
  String get hubTerminal => 'Terminal';

  @override
  String get hubSessionNoTurns => 'Nenhuma rodada concluída ainda';

  @override
  String get hubSessionElapsed => 'Tempo decorrido';

  @override
  String get hubSessionSteps => 'Etapas';

  @override
  String get hubSessionChangedFiles => 'Arquivos alterados';

  @override
  String get hubSessionTrajectoryHint => 'As etapas e o tempo de cada rodada aparecem aqui';

  @override
  String get hubSessionLoadEarlier => 'Carregar rodadas anteriores';

  @override
  String get hubSessionError => 'Erro';

  @override
  String get hubSessionInterrupted => 'Interrompido';

  @override
  String get hubSessionOutputLimit => 'Limite de saída atingido';

  @override
  String get hubSessionNoChanges => 'Nenhum arquivo alterado ainda';

  @override
  String get hubSessionShellChangesHint => 'Os arquivos alterados com comandos shell não são mostrados aqui';

  @override
  String get hubSessionChanges => 'Alterações na conversa';

  @override
  String get hubSessionChangesNote =>
      'Somente as alterações feitas com as ferramentas de gravação e edição no histórico carregado estão incluídas';

  @override
  String get hubSessionNoGoal => 'Nenhum objetivo ou tarefa ainda';

  @override
  String get hubSessionGoalHint => 'A IA lista tarefas em trabalhos complexos. Acompanhe o progresso aqui.';

  @override
  String get hubSessionGoal => 'Objetivo';

  @override
  String get hubSessionPlanMode => 'Modo de plano';

  @override
  String get hubSessionPlanSwitching => 'Mudando para o modo de planejamento';

  @override
  String get hubSessionPlanHint => 'A IA planeja primeiro, sem alterar arquivos';

  @override
  String get hubSessionTodos => 'Tarefas';

  @override
  String get hubSessionNotStarted => 'Não iniciado';

  @override
  String get hubSessionTurnUsage => 'Uso por rodada';

  @override
  String get hubSessionNoSubagents => 'Nenhum subagente delegado';

  @override
  String get hubSessionDelegations => 'Histórico das delegações';

  @override
  String get hubTabTrajectory => 'Trajetória';

  @override
  String get hubTabChanges => 'Alterações';

  @override
  String get hubTabFiles => 'Arquivos';

  @override
  String get hubTabProgress => 'Progresso';

  @override
  String get hubTabContext => 'Contexto';

  @override
  String get hubTabSubagents => 'Subagentes';

  @override
  String get hubPlugins => 'Plugins';

  @override
  String get hubSettingsFullAccessTitle => 'Ativar acesso completo?';

  @override
  String get hubSettingsFullAccessBody => 'A IA poderá executar comandos e alterar arquivos sem pedir confirmação.';

  @override
  String get hubSettingsStorageTitle => 'Permitir que a IA acesse arquivos do celular?';

  @override
  String get hubSettingsStorageAllow => 'Permitir acesso';

  @override
  String get hubSettingsStorageDenied =>
      'Acesso ao armazenamento não concedido. Ative “Acesso a todos os arquivos” para o DSH Go nas configurações do sistema e tente novamente.';

  @override
  String get hubSettingsRestartRequired => 'Entra em vigor após reiniciar o mecanismo';

  @override
  String get hubSettingsRestartNow => 'Reiniciar agora';

  @override
  String get hubSettingsInterface => 'Interface';

  @override
  String get hubSettingsChat => 'Conversas';

  @override
  String get hubSettingsAutoCommands => 'Executar comandos automaticamente';

  @override
  String get hubSettingsPhoneFiles => 'Acessar arquivos do celular';

  @override
  String get hubSettingsPhoneFilesHint => 'A IA pode ler e editar arquivos do celular';

  @override
  String get hubSettingsVisualReplies => 'Respostas visuais';

  @override
  String get hubSettingsVisualRepliesHint => 'Gráficos, comparações e opções interativas';

  @override
  String get hubSettingsPhoneControl => 'Controle do celular';

  @override
  String get hubSettingsPhoneControlHint => 'A IA lê a tela e toca por você';

  @override
  String get hubSettingsPreferences => 'Preferências pessoais';

  @override
  String get hubSettingsAppearance => 'Aparência';

  @override
  String get hubSettingsChatTextSize => 'Tamanho do texto da conversa';

  @override
  String get hubSettingsCollapseSteps => 'Recolher etapas ao concluir';

  @override
  String get hubSettingsCollapseStepsHint => 'Recolhe o raciocínio e as chamadas de ferramentas em uma linha';

  @override
  String get hubSettingsWebPhoneLayout => 'Layout web para celular';

  @override
  String get hubSettingsWebPhoneLayoutHint => 'Adapta a interface web do DSH à tela do celular';

  @override
  String get hubSettingsEngineExtensions => 'Mecanismo e extensões';

  @override
  String get hubSettingsEngine => 'Mecanismo local';

  @override
  String get hubSettingsProviders => 'Modelos';

  @override
  String get hubSettingsEngineSettings => 'Configurações do mecanismo';

  @override
  String get hubSettingsShareConfig => 'Compartilhar a configuração';

  @override
  String get hubSettingsAllFeatures => 'Todos os recursos';

  @override
  String get hubSettingsAbout => 'Sobre';

  @override
  String get hubSettingsCommunity => 'Comunidade';

  @override
  String get hubSettingsLicenses => 'Licenças de código aberto';

  @override
  String get hubSettingsAccount => 'Conta DeepSeek';

  @override
  String get hubSettingsSigningIn => 'Entrando…';

  @override
  String get hubSettingsInvalidKey => 'Chave de API inválida. Não foi possível consultar o saldo';

  @override
  String get hubSettingsNoApiKey => 'Sem chave de API definida';

  @override
  String get hubSettingsApiKeyHint => 'Adicione uma chave de API para iniciar uma conversa';

  @override
  String get hubSettingsSignInAccount => 'Entrar com a conta DeepSeek';

  @override
  String get hubSettingsOrApiKey => 'Ou adicionar uma chave de API';

  @override
  String get hubPluginShare => 'Compartilhar plugin';

  @override
  String get hubPluginDetails => 'Detalhes do plugin';

  @override
  String get hubPluginFeatured => 'Destaque em dshfind';

  @override
  String get hubPluginWebOnly => 'Apenas na Web';

  @override
  String get hubPluginStars => 'Estrelas';

  @override
  String get hubPluginSource => 'Origem';

  @override
  String get hubPluginInstalledVersion => 'Versão instalada';

  @override
  String get hubPluginRequiresDsh => 'Requer DSH';

  @override
  String get hubPluginPackageName => 'Nome do pacote';

  @override
  String get hubPluginHomepage => 'Página do projeto';

  @override
  String get hubPluginRepository => 'Repositório';

  @override
  String get hubPluginManageTitle => 'Gerenciar plugin';

  @override
  String get hubPluginManage => 'Gerenciar';

  @override
  String get hubPluginSafeModeInstall => 'Não é possível instalar no modo Seguro';

  @override
  String get hubPluginInstallCommand => 'Obter o comando de instalação';

  @override
  String get hubPluginInstallComputer => 'Instalar no computador';

  @override
  String get hubPluginInstalling => 'Instalando...';

  @override
  String get hubPluginAllowBuilds => 'Permitir scripts e tentar novamente';

  @override
  String get hubPluginRetryInstall => 'Tentar instalar novamente';

  @override
  String get hubPluginOfficial => 'DSH oficial';

  @override
  String get hubPluginNotLoaded => 'Não foi possível carregar';

  @override
  String get hubPluginComponents => 'Componentes';

  @override
  String get hubPluginSafeModeRemove => 'Não é possível desinstalar em modo seguro';

  @override
  String get hubPluginRemoveCommand => 'Obter o comando de desinstalação';

  @override
  String get hubPluginRemoveComputer => 'Desinstalar no computador';

  @override
  String get hubPluginUninstall => 'Desinstalar';

  @override
  String hubSessionTurns(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count rodadas', one: '1 rodada');
    return '$_temp0';
  }

  @override
  String hubSessionTurnsRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rodadas · Em andamento',
      one: '1 rodada · Em andamento',
    );
    return '$_temp0';
  }

  @override
  String hubSessionStepCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count etapas', one: '1 etapa');
    return '$_temp0';
  }

  @override
  String hubSessionWaitTime(String duration) {
    return 'Aguardou você por $duration';
  }

  @override
  String hubSessionTurn(int turn) {
    return 'Rodada $turn';
  }

  @override
  String hubSessionFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos alterados',
      one: '1 arquivo alterado',
    );
    return '$_temp0';
  }

  @override
  String hubSessionEditCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Editado $count vezes',
      one: 'Editado uma vez',
    );
    return '$_temp0';
  }

  @override
  String hubSessionTurnOf(int turn, int total) {
    return 'Rodada $turn de $total';
  }

  @override
  String hubSessionCacheHit(String percent) {
    return '$percent cache';
  }

  @override
  String get hubSessionBlocked => 'Bloqueado';

  @override
  String hubSessionBlockedReason(String reason) {
    return 'Bloqueado: $reason';
  }

  @override
  String hubSessionTodoSemantics(String content, String status) {
    return '$content, $status';
  }

  @override
  String get hubSettingsStorageBody =>
      'A IA poderá ler e alterar suas fotos, downloads e documentos. O mecanismo será reiniciado.';

  @override
  String hubSettingsBalance(String amount) {
    return 'Saldo $amount';
  }

  @override
  String hubSettingsBalanceLow(String amount) {
    return 'Saldo $amount · Saldo baixo';
  }

  @override
  String hubSettingsAccountSemantics(String title, String subtitle) {
    return 'Conta: $title, $subtitle';
  }

  @override
  String hubSettingsHostSemantics(String name, String status) {
    return 'Máquina remota: $name, $status';
  }

  @override
  String get hubSettingsApiKey => 'Chave de API DeepSeek';

  @override
  String hubPluginBrowserFailed(String address) {
    return 'Não foi possível abrir o navegador. Acesse $address manualmente.';
  }

  @override
  String hubPluginYearMonth(int year, String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Fev',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'Maio',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Out',
      '11': 'Nov',
      '12': 'Dez',
      'other': '$month',
    });
    return '$_temp0 $year';
  }

  @override
  String hubPluginUpdateTo(String version) {
    return 'Atualizar para $version';
  }

  @override
  String hubPluginInstallOn(String host) {
    return 'Instalar em $host';
  }

  @override
  String hubPluginComponentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count componentes', one: '1 componente');
    return '$_temp0';
  }

  @override
  String get hubPluginComponentSeparator => ', ';

  @override
  String get hubGroupAi => 'IA';

  @override
  String get hubGroupCapabilities => 'Capacidades';

  @override
  String get hubGroupGeneral => 'Geral';

  @override
  String get hubGroupHosts => 'Máquinas';

  @override
  String get hubGroupHelp => 'Ajuda e sobre';

  @override
  String get hubPersonalization => 'Personalização';

  @override
  String get hubPersonalizationAboutYou => 'Sobre você';

  @override
  String get hubPersonalizationReplies => 'Respostas';

  @override
  String get hubPersonalizationWorkStyle => 'Estilo de trabalho';

  @override
  String get hubPrivacy => 'Privacidade e compartilhamento';

  @override
  String get hubPrivacySharing => 'Compartilhamento';

  @override
  String get hubInterfaceHome => 'Início';

  @override
  String get hubInterfaceWebHint => 'Interface web do DSH';

  @override
  String get hubInterfaceOpenWeb => 'Abrir interface web';

  @override
  String get hubInterfacePhoneLayout => 'Layout para celular';

  @override
  String get hubAbout => 'Sobre o DSH Go';

  @override
  String get hubAboutNewVersion => 'Atualizar disponível';

  @override
  String get hubValueSet => 'Definido';

  @override
  String get hubValueOff => 'Desativado';

  @override
  String get hubValueOneStep => 'Falta uma etapa';

  @override
  String get hubValueAllowed => 'Autorizado';

  @override
  String get hubValueNeedsSetup => 'Configurar';

  @override
  String hubValueHosts(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count máquinas', one: '1 máquina');
    return '$_temp0';
  }

  @override
  String get hubValueNoHosts => 'Nenhum';

  @override
  String hubValuePlugins(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count plugins', one: '1 plugin');
    return '$_temp0';
  }

  @override
  String get hubEngineStartup => 'Inicialização';

  @override
  String get hubThemeLightDark => 'Claro e escuro';

  @override
  String get hubPermissionPhone => 'Celular';

  @override
  String get hubPermissionPhoneConfirm => 'Confirmação do controle do celular';

  @override
  String get launchScreenTitle => 'Tela de lançamento';

  @override
  String get launchDefault => 'Padrão';

  @override
  String get launchCustom => 'Personalizado';

  @override
  String get launchFit => 'Ajustar';

  @override
  String get launchFitFill => 'Preencher';

  @override
  String get launchFitCenter => 'Centro';

  @override
  String get launchBackground => 'Contexto';

  @override
  String get launchBackdropAuto => 'Automático';

  @override
  String get launchBackdropEdge => 'Da imagem';

  @override
  String get launchBackdropWhite => 'Branco';

  @override
  String get launchBackdropBlack => 'Preto';

  @override
  String get launchReplace => 'Substituir imagem ou vídeo';

  @override
  String get launchPreview => 'Antevisão';

  @override
  String get launchFooter =>
      'Fotos e animações até 8 MB, vídeos até 30 MB. Joga uma vez em um começo frio; toque para pular.';

  @override
  String get launchChanged => 'Tela de lançamento alterado';

  @override
  String launchChangedSize(String size) {
    return 'A tela de lançamento mudou · $size';
  }

  @override
  String get launchTooLarge => 'A imagem tem mais de 8 MB';

  @override
  String get launchOverLimit => 'O arquivo tem mais de 30 MB';

  @override
  String get launchUnsupported => 'Usar um PNG, JPEG, WebP, GIF ou MP4';

  @override
  String get launchUnreadable => 'Não foi possível ler este arquivo';

  @override
  String get launchUnavailable => 'Não foi possível abrir suas fotos';

  @override
  String get launchBroken => 'Não é possível ler';

  @override
  String get iconShortcutRow => 'Atalho de imagem';

  @override
  String get iconShortcutRowSubtitle => 'Sua própria imagem na tela inicial';

  @override
  String get iconShortcutPick => 'Escolher uma imagem';

  @override
  String get iconShortcutChange => 'Outra imagem';

  @override
  String get iconShortcutHint => 'Arrastar ou beliscar para caber';

  @override
  String get iconShortcutName => 'Nome';

  @override
  String get iconShortcutAdd => 'Adicionar à tela inicial';

  @override
  String get iconShortcutNote =>
      'Android não deixa um aplicativo usar qualquer imagem como seu ícone, então isso adiciona um atalho separado que abre DSH Go. Algumas telas iniciais colocam um pequeno crachá em seu canto.';

  @override
  String get iconShortcutAdded => 'Adicionado à sua tela inicial';

  @override
  String get iconShortcutConfirm => 'Confirmar na janela que aparece';

  @override
  String get iconShortcutNoDialog =>
      'Sem diálogo? Permitir DSH Go para criar atalhos de tela inicial nas configurações do sistema.';

  @override
  String get iconShortcutSettings => 'Configuração';

  @override
  String get iconShortcutUnsupported => 'Esta tela inicial não toma atalhos';

  @override
  String get iconShortcutFailed => 'Não consegui adicioná-lo. Tente novamente mais tarde.';

  @override
  String get searchKwLaunchScreen => 'splash, startup, animação de lançamento, tela aberta';

  @override
  String get searchKwIconShortcut => 'atalho, ícone personalizado, imagem da tela pessoal';

  @override
  String get localeTitle => 'Idioma';

  @override
  String get localeSystem => 'Sistema';

  @override
  String get localeZh => '简体中文';

  @override
  String get localeEn => 'English';

  @override
  String get localePt => 'Português';

  @override
  String get localEnvChooseTitle => 'Onde executar o DSH?';

  @override
  String get localEnvChooseMessage => 'Você pode mudar isso depois em Configurações';

  @override
  String localEnvThisPhoneDetail(int storage, int memory) {
    return '$storage MB de armazenamento · $memory MB de memória';
  }

  @override
  String localEnvThisPhoneDetailShort(int memory) {
    return '$memory MB de memória durante o uso';
  }

  @override
  String localEnvLowStorage(int needed) {
    return 'Precisa de cerca de $needed MB livres';
  }

  @override
  String get localEnvRemoteDetail => 'Use o DSH no seu computador ou servidor';

  @override
  String get localEnvRecommended => 'Recomendado';

  @override
  String get localEnvInstallTitle => 'Instalar neste celular';

  @override
  String get localEnvInstallMessage => 'Execute o DSH diretamente neste celular';

  @override
  String localEnvFactStorage(int storage) {
    return 'Cerca de $storage MB de armazenamento';
  }

  @override
  String localEnvFactMemory(int memory) {
    return 'Cerca de $memory MB de memória durante o uso';
  }

  @override
  String get localEnvUseRemote => 'Usar uma máquina remota';

  @override
  String get localEnvNotInstalled => 'Não instalado neste celular';

  @override
  String get localEnvUninstall => 'Desinstalar o ambiente de execução';

  @override
  String get localEnvUninstallHint => 'Liberar espaço de armazenamento';

  @override
  String get localEnvUninstallTitle => 'Desinstalar o ambiente de execução?';

  @override
  String get localEnvUninstallBody =>
      'As conversas, os espaços de trabalho, os plugins, as configurações, as configurações da interface e as habilidades deste celular serão excluídos.';

  @override
  String get localEnvUninstallConfirm => 'Desinstalar';

  @override
  String get localEnvUninstallFailed => 'Não foi possível desinstalar. Tente novamente.';

  @override
  String get localEnvPhoneNeedsRuntime => 'Disponível após a instalação neste celular';

  @override
  String get localEnvSignInNeedsRuntime => 'Requer o DSH neste celular';

  @override
  String get localEnvSignInInstallFirst => 'Instale o DSH para entrar';

  @override
  String get mediaGenerateTile => 'Criar';

  @override
  String get mediaAiGenerated => 'Gerado por IA';

  @override
  String mediaCostEstimate(String amount) {
    return 'Sobre $amount';
  }

  @override
  String mediaSavedCount(int count) {
    return 'Gravado $count para Fotos';
  }

  @override
  String get mediaRegenerate => 'Regenerar';

  @override
  String get mediaCopyPrompt => 'Copiar o prompt';

  @override
  String get mediaFileGone => 'O arquivo desapareceu';

  @override
  String get mediaKindImage => 'Imagem';

  @override
  String get mediaKindVideo => 'Vídeo';

  @override
  String get mediaTitleImage => 'Nova imagem';

  @override
  String get mediaTitleVideo => 'Novo vídeo';

  @override
  String get mediaOpenElsewhere => 'Abrir em outro aplicativo';

  @override
  String get mediaShowInFiles => 'Mostrar nos arquivos';

  @override
  String get mediaGenerating => 'Gerando';

  @override
  String mediaGeneratingProgress(String progress) {
    return 'Gerando · $progress';
  }

  @override
  String get mediaCancelled => 'Cancelado';

  @override
  String get mediaNotGenerated => 'Não criado';

  @override
  String mediaPartial(int done, int total) {
    return '$done de $total';
  }

  @override
  String mediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count imagens', one: '1 imagem');
    return '$_temp0';
  }

  @override
  String mediaSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String mediaImageOf(int index, int count) {
    return 'Imagem $index de $count';
  }

  @override
  String mediaPageOf(int index, int count) {
    return '$index / $count';
  }

  @override
  String get mediaErrorPolicyInput => 'A descrição não passou na revisão de conteúdo';

  @override
  String get mediaErrorPolicyOutput => 'O resultado não passou na revisão de conteúdo';

  @override
  String get mediaErrorAuth => 'Serviço não autorizado';

  @override
  String get mediaErrorBalance => 'Saldo insuficiente';

  @override
  String get mediaErrorQuota => 'O limite de hoje está esgotado';

  @override
  String get mediaErrorUnavailable => 'Serviço indisponível por enquanto';

  @override
  String get mediaErrorExpired => 'O resultado expirou';

  @override
  String get mediaErrorGeneric => 'Não foi possível criá-lo';

  @override
  String get mediaVary => 'Vary';

  @override
  String get mediaEdit => 'Editar';

  @override
  String get mediaRevise => 'Revisar';

  @override
  String get mediaUpscale => 'Escala de Upscale';

  @override
  String get mediaMakeVideo => 'Fazer um vídeo';

  @override
  String get mediaDetailModel => 'Modelo';

  @override
  String get mediaDetailSize => 'Tamanho';

  @override
  String get mediaDetailCost => 'Custo';

  @override
  String get mediaDetailProvenance => 'Provença';

  @override
  String get mediaDetailFile => 'Arquivo';

  @override
  String mediaOriginalPrompt(String text) {
    return 'Original: $text';
  }

  @override
  String get mediaProvenanceC2pa => 'C2PA';

  @override
  String get mediaProvenanceImplicit => 'Incorporado';

  @override
  String get mediaProvenanceVisible => 'Marca visível';

  @override
  String get mediaModeExit => 'Deixar modo de criação';

  @override
  String mediaModeLabel(String summary) {
    return 'Criar configurações: $summary';
  }

  @override
  String get mediaParamModel => 'Modelo';

  @override
  String get mediaParamAspect => 'Aspecto';

  @override
  String get mediaParamCount => 'Número';

  @override
  String get mediaParamQuality => 'Qualidade';

  @override
  String get mediaParamDuration => 'Comprimento';

  @override
  String get mediaQualityAuto => 'Automático';

  @override
  String get mediaQualityStandard => 'Padrão';

  @override
  String get mediaQualityHigh => 'HD';

  @override
  String get mediaQuality4k => '4K';

  @override
  String get mediaQualityLevelLow => 'Baixo';

  @override
  String get mediaQualityLevelMedium => 'Médio';

  @override
  String get mediaQualityLevelHigh => 'Alta';

  @override
  String get mediaModelPick => 'Escolher';

  @override
  String get mediaPickModelFirst => 'Escolha um modelo primeiro';

  @override
  String mediaPricePerImage(String price) {
    return '$price / imagem';
  }

  @override
  String mediaPricePerSecond(String price) {
    return '$price / s';
  }

  @override
  String get mediaManageModels => 'Gerenciar';

  @override
  String get mediaHintImage => 'Descreva a imagem...';

  @override
  String get mediaHintVideo => 'Descreva a cena e o tiro...';

  @override
  String get mediaHintEdit => 'Como deve mudar...';

  @override
  String get mediaFirstFrame => 'Primeiro';

  @override
  String get mediaLastFrame => 'Último';

  @override
  String get mediaNoLastFrame => 'Este modelo não leva nenhuma última moldura';

  @override
  String get mediaNoRefs => 'Este modelo não leva imagens de referência';

  @override
  String mediaRefLimit(int count) {
    return 'Até $count imagens de referência';
  }

  @override
  String get mediaNoDescription => 'Descreva primeiro';

  @override
  String get mediaDescriptionTooLong => 'Demasiado tempo para gerar. Encurtar a descrição';

  @override
  String get mediaInstallTitle => 'Imagens e vídeo';

  @override
  String get mediaInstallBody => 'Esta máquina ainda não tem plug- in de imagem e vídeo';

  @override
  String get mediaInstallAction => 'Instalar nesta máquina';

  @override
  String get mediaUnavailableTitle => 'Modo de geração indisponível';

  @override
  String get mediaUnavailableBody =>
      'O plugin de imagem e vídeo neste host não é compatível. Você ainda pode descrever o que quer no chat.';

  @override
  String get mediaUnavailableAction => 'Gerenciar plug-ins';

  @override
  String get mediaSettingsTitle => 'Imagens e vídeo';

  @override
  String get searchKwMediaGeneration =>
      'geração de imagens, texto para imagem, geração de vídeos,IA arte, gerar imagens, gerar vídeo';

  @override
  String get nearbyThisChat => 'Esta conversa';

  @override
  String get nearbyPermissionTitle => 'Permissões para esta conversa';

  @override
  String nearbyNewChatDefault(String name) {
    return 'Novas conversas: $name';
  }

  @override
  String get nearbySetAsDefault => 'Usar para novas conversas';

  @override
  String get nearbyManageModels => 'Gerenciar modelos';

  @override
  String nearbyPermissionPill(String name) {
    return 'Permissões para esta conversa: $name';
  }

  @override
  String get nearbyChange => 'Alterar';

  @override
  String get performanceTitle => 'Desempenho';

  @override
  String get performanceAuto => 'Automático';

  @override
  String get performanceFull => 'Completo';

  @override
  String get performanceLight => 'Luz';

  @override
  String get performanceAutoHint => 'Ajustar os efeitos por padrão deste dispositivo';

  @override
  String get performanceFullHint => 'Manter o borrão e a animação';

  @override
  String get performanceLightHint => 'Reduzir os efeitos em curso e o uso dos recursos';

  @override
  String get performanceChoiceHint => 'Suas escolhas de animal de estimação e motor têm prioridade';

  @override
  String get performanceCooling => 'Reduzir os efeitos até que o dispositivo esfrie';

  @override
  String get performanceEffects => 'Efeitos da interface';

  @override
  String get performanceBlur => 'Borrão de vidro';

  @override
  String get performanceAnimations => 'Animação da interface';

  @override
  String get performanceSystemMotion => 'Também segue a configuração de animações de remoção do sistema';

  @override
  String get performanceFollowMode => 'Siga o modo de desempenho';

  @override
  String get performanceRemoteHint => 'Conecte-se a um computador ou servidor para reduzir o trabalho neste celular';

  @override
  String get phoneDiagnosticsCollecting => 'A recolher...';

  @override
  String get phoneDiagnosticsPacking => 'A empacotar...';

  @override
  String get phoneDiagnosticsSharing => 'A abrir a folha de compartilhamento...';

  @override
  String get phoneDiagnosticsSaving => 'Salvando para Downloads...';

  @override
  String get phoneDiagnosticsShare => 'Compartilhar o pacote de diagnósticos';

  @override
  String get phoneDiagnosticsShareHint => 'Anexar a um relatório de erro';

  @override
  String get phoneDiagnosticsSave => 'Gravar em Downloads';

  @override
  String get phoneDiagnosticsSaveHint => 'Salvar em Downloads/DSH-Go';

  @override
  String get phoneDiagnosticsNote =>
      'Inclui versões, informações do dispositivo, registros e a última falha. Sem chaves ou fichas de API.';

  @override
  String get phoneDiagnosticsExport => 'Pacote de diagnósticos de exportação';

  @override
  String get phoneSafeMode => 'Modo seguro';

  @override
  String get phoneEngineStartingSafeEllipsis => 'Iniciando em modo seguro...';

  @override
  String get phoneEngineStartingEllipsis => 'A começar...';

  @override
  String get phoneEngineTidyingFilesEllipsis => 'A arrumar os arquivos de \'plugin\'...';

  @override
  String get phoneEngineStoppingEllipsis => 'Parar...';

  @override
  String get phoneEngineStoppedNextSafe => 'Parado · Próximo início no modo Seguro';

  @override
  String get phoneEngineInstallingRuntime => 'Instalando o tempo de execução...';

  @override
  String get phoneEngineRuntimeNotInstalled => 'Tempo de execução não instalado';

  @override
  String get phoneEngineErrorSeeLogs => 'Erro no motor. Veja os registros para mais detalhes.';

  @override
  String get phoneEngineTitle => 'Motor local';

  @override
  String get phoneEngineLocal => 'Motor deste celular';

  @override
  String get phoneEngineLogs => 'Registros';

  @override
  String get phoneEngineAutoStart => 'Iniciar quando o DSH Go abrir';

  @override
  String get phoneEngineKeepAlive => 'Fundo em execução';

  @override
  String get phoneEngineKeepAliveHint => 'Evite Android de parar o motor';

  @override
  String get phoneEngineDiagnostics => 'Diagnósticos';

  @override
  String get phoneEngineDiagnosticsHint => 'Informações de execução e relatórios de erros';

  @override
  String get phoneEngineRuntime => 'Tempo de execução';

  @override
  String get phoneEngineArchitecture => 'Arquitetura';

  @override
  String get phoneEngineStopTitle => 'Parar o motor?';

  @override
  String get phoneEngineStopBody =>
      'As conversas ativas serão interrompidas. Você pode começar de novo quando quiseres.';

  @override
  String get phoneEngineInstallRuntime => 'Instalar o tempo de execução';

  @override
  String get phoneEngineStartAgain => 'Começar de novo';

  @override
  String get phoneEngineStart => 'Iniciar';

  @override
  String get phoneEngineRestart => 'Reiniciar';

  @override
  String get phoneEngineResetFailed => 'Não foi possível reiniciar';

  @override
  String get phoneEngineReset => 'Reiniciar tempo de execução';

  @override
  String get phoneEngineResetHint => 'Excluir chats e arquivos e então extrair novamente';

  @override
  String get phoneEngineResetTitle => 'Repor o tempo de execução?';

  @override
  String get phoneEngineKeepUiSkills => 'Manter configurações de interface e habilidades';

  @override
  String get phoneEngineKeepPluginsSettings => 'Manter os plug- ins e configurações instalados';

  @override
  String get phoneEngineDeleteReset => 'Apagar e reiniciar';

  @override
  String get phoneEngineNotInstalled => 'Não instalado';

  @override
  String get phoneEngineInstalling => 'Instalar';

  @override
  String get phoneEngineStoppedSafe => 'Parado · Modo seguro';

  @override
  String get phoneEngineStartingSafe => 'Iniciando em modo seguro';

  @override
  String get phoneEngineStarting => 'Iniciando';

  @override
  String get phoneEngineTidyingFiles => 'A arrumar os arquivos de \'plugin\'';

  @override
  String get phoneEngineRunningProbation => 'Execução · Ensaio';

  @override
  String get phoneEngineStartupFailed => 'Não foi possível iniciar';

  @override
  String get phoneEngineCrashed => 'Caiu';

  @override
  String get phoneEngineKilled => 'Parado por Android';

  @override
  String get phoneEngineError => 'Algo correu mal.';

  @override
  String get phoneEngineRuntimeCorrupt => 'O tempo de execução está danificado. Reinstalar o DSH.';

  @override
  String get phoneEngineExited => 'O motor parou inesperadamente';

  @override
  String get phoneEngineRuntimeMissing => 'O tempo de execução ainda não está instalado';

  @override
  String get phoneEngineSafeUnsupported => 'Este ambiente de execução não oferece modo seguro. Atualize o DSH.';

  @override
  String get phoneEngineRuntimeIncomplete => 'O tempo de execução está incompleto. Reinstalar o DSH.';

  @override
  String get phoneLogEmpty => 'Sem registros ainda';

  @override
  String get phoneLogShareTitle => 'Registros de motores DSH';

  @override
  String get phoneLogCopyAll => 'Copiar tudo';

  @override
  String get phoneBackgroundAllow => 'Permitir o acesso';

  @override
  String get phoneToolScreen => 'Tela de leitura';

  @override
  String get phoneToolCollect => 'Rolar e recolher';

  @override
  String get phoneToolTap => 'Toque em';

  @override
  String get phoneToolType => 'Tipo';

  @override
  String get phoneToolScroll => 'Swipe';

  @override
  String get phoneToolKey => 'Pressione a tecla';

  @override
  String get phoneToolTapCoordinates => 'Coordenadas de toque';

  @override
  String get phoneToolHandoff => 'Devolve-te a mão.';

  @override
  String get phoneToolOpenApp => 'Abrir aplicativo';

  @override
  String get phoneToolListApps => 'Ver aplicativos';

  @override
  String get phoneToolIntent => 'Ação do sistema';

  @override
  String get phoneToolNotify => 'Enviar notificação';

  @override
  String get phoneToolClipboard => 'Área de transferência';

  @override
  String get phoneToolAction => 'Ação';

  @override
  String get phoneDecisionContinued => 'Continuaste.';

  @override
  String get phoneDecisionDone => 'Executado';

  @override
  String get phoneDecisionAllowed => 'Tu permitiste.';

  @override
  String get phoneDecisionPauseExpired => 'Pausas demasiado longas';

  @override
  String get phoneDecisionBlocked => 'Bloqueado';

  @override
  String get phoneDecisionTimeout => 'Tempo esgotado';

  @override
  String get phoneDecisionUnavailable => 'Indisponível';

  @override
  String get phoneDecisionScreenChanged => 'Tela alterado';

  @override
  String get phoneDecisionFailed => 'Não funcionou';

  @override
  String get phoneActionLogTitle => 'Registo de ação';

  @override
  String get phoneActionLogSubtitle => 'Grava as ações, nunca o conteúdo da tela';

  @override
  String get phoneActionLogRefresh => 'Atualizar';

  @override
  String get phoneActionLogEmpty => 'Sem ações ainda';

  @override
  String get phoneActionLogEmptyHint => 'Cada passo DSH dá em seu telefone aparece aqui';

  @override
  String get phoneAppRuleDeny => 'Tira as mãos.';

  @override
  String get phoneAppRuleConfirm => 'Cada passo';

  @override
  String get phoneAppRuleNormal => 'Como de costume';

  @override
  String get phoneAppRuleDenyHint =>
      'Nada de leituras ou escutas. Predefinição para aplicativos bancárias e de pagamento.';

  @override
  String get phoneAppRuleConfirmHint => 'Pode ler a tela. Pergunta antes de tocar ou digitar.';

  @override
  String get phoneAppRuleNormalHint => 'Pergunta apenas antes de ações sensíveis, como enviar';

  @override
  String get phoneAppRulesTitle => 'Regras de aplicativo';

  @override
  String get phoneAppRulesSubtitle =>
      'Aplicativos não listados funcionam como de costume. Ações sensíveis ainda precisam de aprovação.';

  @override
  String get phoneAppRulesUnavailable => 'Não é possível ler as regras da aplicativo';

  @override
  String get phoneTryLater => 'Tente novamente depois.';

  @override
  String get phoneAppRulesChanged => 'Como de costume · Modificado por você';

  @override
  String get phoneAppRulesAdd => 'Adicionar aplicativo';

  @override
  String get phoneAppRulesAddHint => 'Adicionar pelo nome do pacote';

  @override
  String get phoneSensitiveActionsNote =>
      'Senhas, códigos de verificação, pagamentos e configurações do sistema são com você';

  @override
  String get phoneAppRulesSaveFailed => 'Não foi possível salvar. Tente novamente mais tarde.';

  @override
  String get phoneAppRulesAcceptRisk => 'Mudar de qualquer maneira';

  @override
  String get phoneAppRulesPackage => 'Nome da embalagem';

  @override
  String get phoneAppRulesPackageHint => 'Encontre-o em Definições → Apps → App info';

  @override
  String get phoneDndRequiresAndroid => 'Requer Android 14 ou posterior';

  @override
  String get phoneDndHiddenScreen => 'Funciona em uma tela escondida';

  @override
  String get phoneDndShizukuReady => 'Shizuku · Pronto';

  @override
  String get phoneNotReadyYet => 'Ainda não está pronto.';

  @override
  String get phoneDndAdbReady => 'ADB direto · Pronto';

  @override
  String get phoneActionFailedLater => 'Não foi possível completar. Tente novamente mais tarde.';

  @override
  String get phoneDndDisabled => 'O modo não- disruptivo está desligado';

  @override
  String get phoneDndEnabled => 'O modo não- disruptivo está ligado';

  @override
  String get phoneDndShizukuPermissionFailed =>
      'Permissão não concedida. Permitir DSH Go no “Gestão de Aplicativo” de Shizuku.';

  @override
  String get phoneDndPairedConnect => 'Emparelhado. Toque em “Conectar”.';

  @override
  String get phoneDndTitle => 'Modo não- disruptivo';

  @override
  String get phoneDndSubtitle => 'Funciona em uma tela escondida enquanto você usa seu telefone';

  @override
  String get phoneDndUnsupported => 'Este celular precisa do Android 14 ou posterior para usar este recurso.';

  @override
  String get phoneDndRequirements => 'Requisitos';

  @override
  String get phoneDndKeepUnlocked => 'Mantenha o tela ligado e desbloqueado.';

  @override
  String get phoneDndReactivate => 'Reactivar após reiniciar o celular.';

  @override
  String get phoneDndKeepDebugging => 'Fique no Wi-Fi com opções de desenvolvedor e depuração sem fio.';

  @override
  String get phoneDndUsingShizuku => 'Usando Shizuku';

  @override
  String get phoneDndUsingAdb => 'Usar o ADB Directo';

  @override
  String get phoneReady => 'Pronto';

  @override
  String get phoneDndUseShizuku => 'Usar Shizuku';

  @override
  String get phoneDndDirectAdb => 'ADB direto';

  @override
  String get phoneDndInstallShizuku =>
      'Instale Shizuku primeiro (livre e código aberto). Se você usar ferramentas como Ice Box ou Brevent, você já pode tê-lo.';

  @override
  String get phoneDndOpenShizukuSite => 'Abra o site Shizuku';

  @override
  String get phoneDndStartShizuku =>
      'Abra Shizuku e siga \"Iniciar via Wireless debugging\" (requer Wi-Fi). Esta página atualiza quando você retornar.';

  @override
  String get phoneDndGrantShizukuHint => 'Shizuku está a fugir. Permitir DSH Go usá-lo a seguir.';

  @override
  String get phoneDndGrantShizuku => 'Permitir o DSH Go';

  @override
  String get phoneDndShizukuAllSet => 'Shizuku está pronto.';

  @override
  String get phoneDndShizukuInstalled => 'Shizuku instalado';

  @override
  String get phoneDndShizukuRunning => 'Shizuku correndo';

  @override
  String get phoneDndShizukuGranted => 'DSH Go permitido';

  @override
  String get phoneDndShizukuCompatibility =>
      'Esta versão Android tem problemas de compatibilidade com o lançamento oficial Shizuku.';

  @override
  String get phoneDndWirelessDebuggingOn => 'Depuração sem fio ligada';

  @override
  String get phoneDndPaired => 'Emparelhado';

  @override
  String get phoneDndConnected => 'Ligado';

  @override
  String get phoneDndPairOnce => 'Par uma vez (sem aplicativo extra)';

  @override
  String get phoneDndDeveloperOptionsStep =>
      'Ativar as opções do Desenvolvedor: toque em “Compilar número” 7 vezes em “Sobre telefone”. Em Xiaomi, toque em “versão OS” em “Meu dispositivo → Informações detalhadas e especificações”; on vivo, toque em “Versão de software”.';

  @override
  String get phoneDndWirelessDebuggingStep =>
      'Ligue \"Depuração sem fio\" nas opções de Desenvolvedor enquanto conectado ao Wi-Fi. As opções do desenvolvedor estão geralmente em \"Sistema\" ou \"Configurações adicionais\".';

  @override
  String get phoneDndStartPairingStep =>
      'Volte aqui e toque em \"Iniciar emparelhamento\". O DSH envia uma notificação.';

  @override
  String get phoneDndGetPairingCodeStep =>
      'Em “Depuração sem fio”, toque em “Dispositivo Pair com código de pareamento” para ver um código de 6 dígitos.';

  @override
  String get phoneDndEnterPairingCodeStep =>
      'Retire as notificações e digite o código na notificação do DSH. Uma vez emparelhado, toque em “Conectar”.';

  @override
  String get phoneDndStartPairing => 'Iniciar emparelhamento';

  @override
  String get phoneDndPairingNotificationSent => 'Notificação enviada. Obtenha o código em “Depuração sem fio”.';

  @override
  String get phoneDndManualEntry => 'Digite manualmente';

  @override
  String get phoneDndConnect => 'Ligar';

  @override
  String get phoneDndManualEntryHint => 'Nenhum campo de entrada na notificação? Use \"Enter manualmente\".';

  @override
  String get phoneDndXiaomiUsbHint =>
      'Ligar “Depuração USB (Configurações de segurança)” requer um cartão SIM e uma conta Xiaomi.';

  @override
  String get phoneDndEnable => 'Ativar o modo não- disruptivo';

  @override
  String get phoneDndEnterCodeTitle => 'Digite o código de pareamento';

  @override
  String get phoneDndCodeLabel => 'Código de pareamento de 6 dígitos';

  @override
  String get phoneDndPortLabel => 'Porto (opcional)';

  @override
  String get phoneDndPortHint => 'O número após o ponto no “endereço IP & porta” abaixo do código de pareamento';

  @override
  String get phoneDndPair => 'Par';

  @override
  String get phoneConfirmAsk => 'Perguntar sempre';

  @override
  String get phoneConfirmTask => 'Esta tarefa';

  @override
  String get phoneConfirmAlways => 'Nunca perguntar';

  @override
  String get phoneConfirmAskHint => 'Pergunta antes de abrir um novo aplicativo, enviar, excluir ou pagar';

  @override
  String get phoneConfirmTaskHint => 'Pergunta uma vez por tarefa';

  @override
  String get phoneConfirmAlwaysHint => 'Age sem pedir confirmação';

  @override
  String get phoneConfirmTitle => 'Confirmação';

  @override
  String get phoneConfirmAlwaysTitle => 'Ignorar sempre as confirmações?';

  @override
  String get phoneConfirmAlwaysBody =>
      'O DSH poderá abrir aplicativos, tocar, enviar e excluir sem pedir sua confirmação.';

  @override
  String get phoneConfirmSaveFailed => 'Não foi possível alterar. Tente novamente mais tarde.';

  @override
  String get phoneEnableFailed => 'Não conseguia ligar. Tente novamente mais tarde.';

  @override
  String get phoneDisableFailed => 'Não consegui desligar. Tente novamente mais tarde.';

  @override
  String get phoneEnabled => 'Ligado';

  @override
  String get phoneDisabled => 'Desligado';

  @override
  String get phoneOpenAccessibilityFailed =>
      'Não é possível abrir as configurações. Encontre DSH em Configurações → Acessibilidade.';

  @override
  String get phoneOpenAppInfoFailed =>
      'Não é possível abrir as informações do aplicativo. Encontrar DSH Go em Definições → Apps.';

  @override
  String get phoneStopFailed => 'Não conseguia parar. Toque em \"Pare\" na barra flutuante ou notificação.';

  @override
  String get phoneControlTitle => 'Controle telefónico';

  @override
  String get phoneControlSubtitle => 'Lê a tela e toca para você. Pára quando quiseres.';

  @override
  String get phoneControlWorking => 'Operando seu telefone';

  @override
  String get phoneControlTaskNoConfirmHint =>
      'Confirmação ignorada nesta tarefa · Pause ou interrompa pela barra flutuante';

  @override
  String get phoneControlFloatingBarHint => 'Pausar ou parar da barra flutuante';

  @override
  String get phoneControlAdvanced => 'Avançado';

  @override
  String get phoneControlKeepAliveHint => 'Evite que o Android desligue a acessibilidade';

  @override
  String get phoneControlReadingEllipsis => 'A ler...';

  @override
  String get phoneControlNotReady => 'Não pronto';

  @override
  String get phoneControlNotEnabled => 'Desligado';

  @override
  String get phoneControlSafeModeNotLoaded => 'Não carregado no modo Seguro';

  @override
  String get phoneControlLocalOnly => 'Apenas disponível com o motor deste celular';

  @override
  String get phoneControlAfterEngineStarts => 'Faz efeito quando o motor liga';

  @override
  String get phoneControlNeedsAccessibility => 'Um passo à esquerda: ligar a acessibilidade';

  @override
  String get phoneControlReady => 'Pronto para controlar o telefone';

  @override
  String get phoneControlSetup => 'Configurar';

  @override
  String get phoneControlAccessibilityService => 'Serviço de acessibilidade';

  @override
  String get phoneControlAccessibilityReady => 'Pronto para ler o tela e tocar';

  @override
  String get phoneControlAccessibilityReconnect => 'Serviço desligado. Desliga-o e liga-o outra vez.';

  @override
  String get phoneControlAccessibilityHint => 'Precisava ler a tela e tocar';

  @override
  String get phoneControlGoSettings => 'Abrir configurações';

  @override
  String get phoneControlGoEnable => 'Ligar';

  @override
  String get phoneControlAccessibilityBlocked => 'Comutador de acessibilidade desativado?';

  @override
  String get phoneControlRestrictedAfterAttempt =>
      'Parece que não ligou. Os aplicativos sideloaded precisam “Permitir configurações restritas” primeiro.';

  @override
  String get phoneControlRestrictedHint =>
      'Os aplicativos sideloaded precisam “Permitir configurações restritas” primeiro';

  @override
  String get phoneControlNotifications => 'Notificação';

  @override
  String get phoneControlNotificationsPairingHint => 'Utilizado para aprovações, códigos de paragem e emparelhamento';

  @override
  String get phoneControlNotificationsHint => 'Necessário para aprovações e o botão “Parar”';

  @override
  String get phoneControlAllowed => 'Autorizado';

  @override
  String get phoneControlTry => 'Experimenta.';

  @override
  String get phoneControlReadScreen => 'Ler o tela actual';

  @override
  String get phoneControlReadScreenHint => 'Veja o que o DSH lê, sem enviá-lo para o modelo';

  @override
  String get phoneControlEnableAccessibilityFirst => 'Ligar primeiro o serviço de acessibilidade';

  @override
  String get phoneControlLoading => 'Carregando';

  @override
  String get phoneControlRules => 'Regras';

  @override
  String get phoneControlRecentActions => 'Ações recentes';

  @override
  String get phoneControlRecentActionsHint => 'Cada passo é registrado, sem conteúdo da tela';

  @override
  String get phoneControlAllActions => 'Todas as ações';

  @override
  String get phoneControlModuleNotReady => 'Controle de telefone não está pronto nesta versão';

  @override
  String get phoneControlSafeModeUnavailable => 'Indisponível em modo seguro';

  @override
  String get phoneControlSafeModeHint => 'Modo seguro ignora plugins. Mudar para o modo normal para usar isto.';

  @override
  String get phoneControlRemoteHost => 'Ligado a uma máquina remota';

  @override
  String get phoneControlCapabilities => 'O que você pode fazer';

  @override
  String get phoneControlIntents => 'Alarmes, eventos, mapas, compartilhamento';

  @override
  String get phoneControlNoExtraPermissions => 'Não são necessárias permissões adicionais';

  @override
  String get phoneControlReadToTable => 'Leia a tela em tabelas ou tarefas';

  @override
  String get phoneControlNeedsAccessibilityHint => 'Requer acessibilidade';

  @override
  String get phoneControlTapType => 'Toque e digite para você';

  @override
  String get phoneControlSensitiveHint => 'Pergunta antes de enviar ou comprar. Nunca efetua pagamentos.';

  @override
  String get phoneDisclosureWhatTitle => 'O que lê';

  @override
  String get phoneDisclosureWhatBody =>
      'Texto da tela atual. Com um modelo capaz de analisar imagens, uma captura de tela também pode ser enviada.';

  @override
  String get phoneDisclosureWhenTitle => 'Quando lê';

  @override
  String get phoneDisclosureWhenBody =>
      'Somente quando você inicia uma tarefa ou toca em “Ler tela atual”. Em nenhum outro momento.';

  @override
  String get phoneDisclosureWhoTitle => 'Quem o recebe?';

  @override
  String get phoneDisclosureWhoBody =>
      'O modelo DeepSeek que você escolheu, na nuvem. Números de cartões e documentos são ocultados antes.';

  @override
  String get phoneDisclosureNeverTitle => 'O que ele não fará por padrão';

  @override
  String get phoneDisclosureNeverBody =>
      'Não digita senhas ou códigos de verificação nem altera configurações do sistema. Devolve o controle a você e evita aplicativos bancários e de pagamento.';

  @override
  String get phoneDisclosureStopTitle => 'Parar a qualquer momento';

  @override
  String get phoneDisclosureStopBody =>
      'Uma barra flutuante permite pausar, interromper ou orientar. Mantenha a tela ligada e desbloqueada.';

  @override
  String get phoneDisclosureTitle => 'Antes de ativar o controle do celular';

  @override
  String get phoneDisclosureIntro =>
      'O DSH lê a tela e toca nela para realizar tarefas. Antes de ativar, veja como funciona:';

  @override
  String get phoneDisclosureRestartNote => 'O mecanismo será reiniciado e interromperá qualquer resposta em andamento';

  @override
  String get phoneDisclosureNotNow => 'Agora não';

  @override
  String get phoneDisclosureAgreeEnable => 'Concordar e ativar';

  @override
  String get phoneCheckUnknown => 'Não tenho a certeza';

  @override
  String get phoneCheckYes => 'Sim.';

  @override
  String get phoneCheckNotYet => 'Ainda não.';

  @override
  String get phoneRomStock => 'Unidade populacional / Outros';

  @override
  String get phoneRestrictedAccessibility => 'Acessibilidade';

  @override
  String get phoneRestrictedOpenAccessibility => 'Ativar a acessibilidade';

  @override
  String get phoneRestrictedOverlay => 'Janela flutuante';

  @override
  String get phoneRestrictedOpenOverlay => 'Ligar a janela flutuante';

  @override
  String get phoneRestrictedTryAccessibility =>
      'Primeiro tente ligar o DSH em “Acessibilidade”. Quando aparecer “configuração restrita”, toque em “OK”. A opção abaixo aparece apenas após esta etapa.';

  @override
  String get phoneRestrictedOpenInfoStep => 'Volte aqui e toque em \"Abrir informações do aplicativo\".';

  @override
  String get phoneRestrictedBackAccessibility => 'Voltar para “Acessibilidade” e ligar DSH.';

  @override
  String get phoneRestrictedMenuStep =>
      'Toque nos três pontos no canto superior direito, escolha \"Permitir configurações restritas\", em seguida, verifique a senha da tela de bloqueio.';

  @override
  String get phoneRestrictedTryOverlay =>
      'Primeiro tente ligar o DSH Go na configuração da janela flutuante. Quando aparecer “configuração restrita”, toque em “OK”. A opção abaixo aparece apenas após esta etapa.';

  @override
  String get phoneRestrictedBackOverlay => 'Voltar às configurações da janela flutuante e ligar o DSH Go.';

  @override
  String get phoneRestrictedHuaweiOverlay =>
      'HarmonyOS 4 e mais cedo normalmente saltar este passo. Ligar o DSH Go diretamente nas configurações da janela flutuante.';

  @override
  String get phoneRestrictedHuaweiAccessibility =>
      'HarmonyOS 4 e mais cedo normalmente saltar este passo. Ligue o DSH diretamente em “Acessibilidade”.';

  @override
  String get phoneRestrictedVivoNote =>
      'A localização varia de acordo com a versão OriginOS. Se não houver três pontos, role para o fundo das informações do App.';

  @override
  String get phoneRestrictedAdvancedStep =>
      'Em “Configurações avançadas”, encontre “Permitir configurações restritas” e ligue-o.';

  @override
  String get phoneRestrictedOppoNote =>
      'ColorOS pode ocultar esta opção. Use o aplicativo de arquivos embutidos para encontrar o instalador do DSH e instalar sobre o aplicativo existente (não há necessidade de desinstalar; chats e configurações permanecem). Então ligue a acessibilidade.';

  @override
  String get phoneRestrictedHuaweiNote =>
      'Se “Configuração restrita” aparecer na Acessibilidade, siga os passos “Stock / Other”.';

  @override
  String get phoneRestrictedTitle => 'Permitir configurações restritas';

  @override
  String get phoneRestrictedSteps => 'Passos';

  @override
  String get phoneRestrictedDiagram => 'Ilustração';

  @override
  String get phoneRestrictedOpenInfo => 'Abrir informações da aplicativo';

  @override
  String get phoneRestrictedOpenOverlayFailed =>
      'Não é possível abrir as configurações da janela flutuante. Procure por “Floating window” em Configurações.';

  @override
  String get phoneRestrictedOpenAccessibilityFailed =>
      'Não é possível abrir configurações de acessibilidade. Procure “Acessibilidade” em Configurações.';

  @override
  String get phoneRestrictedFootnote =>
      'Os nomes variam de acordo com o sistema. Pesquisar configurações para \"Restrito\" se necessário. Se ainda não abrir, reinicie o telefone e tente novamente.';

  @override
  String get phoneRestrictedAppInfo => 'Informações da aplicativo';

  @override
  String get phoneRestrictedPermissionsManager => 'Gerenciador de permissões';

  @override
  String get phoneRestrictedBatterySaver => 'Salvador de bateria';

  @override
  String get phoneRestrictedAdvanced => 'Configurações avançadas';

  @override
  String get phoneRestrictedPermissions => 'Permissões';

  @override
  String get phoneRestrictedBattery => 'Bateria';

  @override
  String get phoneRestrictedDiagramAdvanced =>
      'Ilustração: Na informação do aplicativo, toque em “Configurações avançadas”, em seguida, ligue “Permitir configurações restritas”.';

  @override
  String get phoneRestrictedDiagramMenu =>
      'Ilustração: Na informação do aplicativo, toque nos três pontos no canto superior direito e, em seguida, escolha “Permitir configurações restritas”.';

  @override
  String get phoneRestrictedCaptionAdvanced => '1 Toque em “Configurações avançadas”';

  @override
  String get phoneRestrictedCaptionMenu => '1 Toque nos três pontos';

  @override
  String get phoneRestrictedCaptionToggle => '2 Ligue este interruptor';

  @override
  String get phoneRestrictedCaptionOption => '2 Escolha esta opção';

  @override
  String get phoneScreenReadFailed => 'Não foi possível ler a tela';

  @override
  String get phoneScreenUnknownReason => 'Razão desconhecida';

  @override
  String get phoneScreenReadFailedHint =>
      'Verifique se a acessibilidade está ligada. Android bloqueia leitura de senha e telas de pagamento.';

  @override
  String get phoneScreenCurrent => 'Tela atual';

  @override
  String get phoneScreenEmpty => '(Sem texto legível no tela)';

  @override
  String get phoneScreenReadNote => 'Isto é o que o modelo veria. Esta leitura não foi enviada para o modelo.';

  @override
  String get phoneFailureSafeStartup => 'Não foi possível iniciar mesmo no modo Seguro';

  @override
  String get phoneFailureSafeStartupHint => 'Provavelmente uma configuração global ou problema de tempo de execução';

  @override
  String get phoneFailureKilled => 'Android parou o motor';

  @override
  String get phoneFailureKilledHint => 'Provavelmente baixas restrições de memória ou bateria';

  @override
  String get phoneFailureLaunch => 'Não foi possível iniciar a execução local';

  @override
  String get phoneFailureLaunchHint => 'Verifique os registros ou conecte- se a uma máquina remota para continuar';

  @override
  String get phoneFailureNoSpaceHint => 'Liberte algum espaço e tente novamente';

  @override
  String get phoneFailureStartup => 'O DSH não pôde iniciar';

  @override
  String get phoneFailureCrashedEarly => 'O DSH caiu logo após o início';

  @override
  String get phoneFailureCrashedLate => 'O DSH caiu durante a execução';

  @override
  String get phoneFailureFatal => 'O motor relatou um erro fatal';

  @override
  String get phoneFailureRestore => 'Restaurar a configuração';

  @override
  String get phoneFailureEnterSafe => 'Entrar no modo seguro';

  @override
  String get phoneFailureStartNormal => 'Iniciar normalmente';

  @override
  String get phoneFailureGlobalPatch => 'Sistema global';

  @override
  String get phoneFailureEnvironment => 'Variáveis ambientais';

  @override
  String get phoneSafeMoveAsideTitle => 'Afastar estes arquivos primeiro?';

  @override
  String get phoneSafeMoveAsideIntro => 'Eles afetam todas as configurações, incluindo o modo Safe:';

  @override
  String get phoneSafeMoveAsideNote =>
      'Os arquivos são renomeados (com .off-timestamp), nunca excluídos. Você pode renomeá-los depois de corrigir o problema.';

  @override
  String get phoneSafeStartDirectly => 'Iniciar diretamente';

  @override
  String get phoneSafeMoveAsideStart => 'Mover e iniciar';

  @override
  String get phoneSafeNoRestoreNeeded =>
      'A configuração corresponde à última versão de trabalho. Não é necessário restaurar.';

  @override
  String get phoneSafeNoRestoreRecord => 'Nenhuma configuração de trabalho anterior gravada';

  @override
  String get phoneSafeRestoreTitle => 'Restaurar a última configuração de trabalho?';

  @override
  String get phoneSafeRestoreStart => 'Restaurar e iniciar';

  @override
  String get phoneSafeRestoredStarting => 'Restaurou a última configuração de trabalho. A começar...';

  @override
  String get phoneSafeRestoreFailed => 'Não foi possível restaurar';

  @override
  String get phoneSafeRestoreIntro => 'DSH irá restaurar a última configuração de trabalho:';

  @override
  String get phoneSafeRestoreSettings =>
      '• Restaurar configurações para essa versão (salvar configurações atuais como backup)';

  @override
  String get phoneSafeRestoreNote =>
      'Nenhum plugin será desinstalado. Não há necessidade de internet. Você pode re- habilitar plugins desativados mais tarde.';

  @override
  String get phoneSafeLeaveTitle => 'Voltar ao modo normal?';

  @override
  String get phoneSafeLeaveBody =>
      'Comece com sua configuração original e plugins. As configurações da Web alteradas no modo Seguro não serão mantidas.';

  @override
  String get phoneSafeLeave => 'Voltar ao modo normal';

  @override
  String get phoneSafeMovePatch => 'Mover para o lado';

  @override
  String get phoneSafeMoveFiles => 'Mover os arquivos para o lado';

  @override
  String get phoneSafeFailureLog => 'Registra a falha';

  @override
  String get phoneSafeFailureLogEmpty => 'Nenhum resultado gravado no momento da falha';

  @override
  String get phoneSafeBannerTitle => 'Modo seguro · Plugins não carregados';

  @override
  String get phoneSafeBannerProbation => 'Tentando o modo normal';

  @override
  String get phoneSafeBannerProbationHint =>
      'Se não ocorrerem erros dentro de 2 minutos, a recuperação está completa. Caso contrário, o modo Safe retorna automaticamente.';

  @override
  String get phoneSafeBannerRunningHint =>
      'Suas conversas estão preservadas. Corrija a configuração e volte ao modo normal.';

  @override
  String get phoneSafeBannerFailedHint => 'Não foi possível iniciar mesmo no modo seguro. Vê a página do motor.';

  @override
  String get phoneSafeBannerStoppedHint => 'O motor parou. O próximo início ainda irá usar o modo Seguro.';

  @override
  String get phoneSafeRepair => 'Ajude-me a corrigir';

  @override
  String get phoneSafeReasonStartup => 'Falha ao iniciar duas vezes seguidas';

  @override
  String get phoneSafeReasonProbation => 'Falhou novamente após a recuperação';

  @override
  String get phoneSafeReasonManual => 'Ligado manualmente';

  @override
  String get phoneSafeNormalSettingsHint => 'Reiniciar com a configuração original e plugins';

  @override
  String get phoneSafeStartSettings => 'Iniciar em modo seguro';

  @override
  String get phoneSafeStartSettingsHint => 'Ignorar os plug-ins para solucionar problemas de inicialização';

  @override
  String get phoneSafeAutoSettings => 'Modo de segurança automática';

  @override
  String get phoneSafeAutoSettingsHint => 'Ligar após falhas de arranque repetidas';

  @override
  String get phoneAccentMist => 'Névoa';

  @override
  String get phoneAccentDaiqing => 'Turquesa';

  @override
  String get phoneAccentDusk => 'Crepúsculo';

  @override
  String get phoneAccentTurquoise => 'Aqua';

  @override
  String get phoneAccentAmber => 'Âmbar';

  @override
  String get phoneAccentGraphite => 'Ardósia';

  @override
  String get phoneAccentCustom => 'Personalizado';

  @override
  String phoneEngineInstallPercent(int percent) {
    return 'Instalando · $percent%';
  }

  @override
  String phoneEngineStatusSemantics(String prefix, String status) {
    return '$prefix motor: $status';
  }

  @override
  String phoneLogLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count linhas', one: '1 linha');
    return '$_temp0';
  }

  @override
  String phoneLogCopiedLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Copiado $count linhas',
      one: 'Copiado 1 linha',
    );
    return '$_temp0';
  }

  @override
  String phoneAppRuleDefault(String rule) {
    return 'Predefinição: $rule';
  }

  @override
  String phoneAppRulesLoosenTitle(String app) {
    return 'Deixe o DSH operar “$app”?';
  }

  @override
  String phoneAppRulesSkipStepsTitle(String app) {
    return 'Pare de confirmar cada passo em “$app”?';
  }

  @override
  String phoneDndShizukuStatus(String reason) {
    return 'Shizuku · $reason';
  }

  @override
  String phoneDndAdbStatus(String reason) {
    return 'ADB direto · $reason';
  }

  @override
  String phoneDndBrowserFailed(String url) {
    return 'Não é possível abrir o navegador. URL: $url';
  }

  @override
  String phoneControlWorkingApp(String app) {
    return 'Funcionamento «$app”';
  }

  @override
  String phoneControlPolicySummary(int denied, int confirmed) {
    String _temp0 = intl.Intl.pluralLogic(
      denied,
      locale: localeName,
      other: '$denied aplicativos fora dos limites',
      one: '1 aplicativo fora dos limites',
    );
    String _temp1 = intl.Intl.pluralLogic(
      confirmed,
      locale: localeName,
      other: '$confirmed apps confirmar cada passo',
      one: '1 aplicativo confirma cada etapa',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String phoneControlRemoteHint(String host) {
    return 'DSH em “$host” não consegue controlar este celular. Mude para “Este celular” para usá-lo.';
  }

  @override
  String phoneRestrictedSubtitle(String place) {
    return 'Permitir isso para aplicativos sideloaded para ativar o $place interruptor';
  }

  @override
  String phoneRestrictedDone(String place) {
    return '$place Está ligado. Você pode voltar.';
  }

  @override
  String phoneFailurePlugins(String plugins) {
    return 'Pode estar relacionado com plugins “$plugins”';
  }

  @override
  String phoneFailureRequired(String components) {
    return 'Componentes necessários $components Verificações de inicialização falhadas';
  }

  @override
  String phoneSafeRestoreAt(String when) {
    return 'DSH irá restaurar a configuração de trabalho de $when:';
  }

  @override
  String phoneSafeRestoreDisable(String plugins) {
    return '• Desactivar: $plugins';
  }

  @override
  String phoneSafeRestoreChanged(String plugins) {
    return '  ($plugins atualizado desde então; só pode ser desativado por enquanto)';
  }

  @override
  String phoneSafeRestoreEnable(String plugins) {
    return '• Reactivar: $plugins';
  }

  @override
  String phoneSafeTodayTime(String time) {
    return 'Hoje $time';
  }

  @override
  String phoneSafeReasonPlugins(String plugins) {
    return 'Não foi possível iniciar duas vezes seguidas. Plugins suspeitos: $plugins';
  }

  @override
  String get phoneListSeparator => ', ';

  @override
  String get phonePluginQuoteSeparator => '”, “';

  @override
  String phoneEngineRunningAt(String address) {
    return 'Em execução · $address';
  }

  @override
  String phoneEngineSafeAt(String address) {
    return 'Modo seguro · $address';
  }

  @override
  String get phoneAppRulesLoosenBody =>
      'Aplicativos bancários e de pagamento detectam automação e podem restringir a entrada ou congelar sua conta. Por padrão, o DSH não digita senhas ou paga.';

  @override
  String get phoneAppRulesSkipStepsBody =>
      'Aplicativos como WeChat watch para automação, e assistentes de telefone tiveram contas encerradas. Com “Como de costume”, apenas ações como enviar mensagens ainda perguntam primeiro.';

  @override
  String get phoneResetDeletesChatsWorkspaces => 'chats e espaços de trabalho';

  @override
  String get phoneResetBodyChatsWorkspaces =>
      'Isso irá excluir chats e espaços de trabalho, e então reinstalar o tempo de execução.';

  @override
  String get phoneResetDeletesWithPlugins => 'chats, espaços de trabalho, plugins e configurações';

  @override
  String get phoneResetBodyWithPlugins =>
      'Isso irá excluir chats, espaços de trabalho, plugins e configurações, e então reinstalar o tempo de execução.';

  @override
  String get phoneResetDeletesWithUi => 'chats, espaços de trabalho, configurações de interface e habilidades';

  @override
  String get phoneResetBodyWithUi =>
      'Isso irá excluir chats, espaços de trabalho, configurações de interface e habilidades, e então reinstalar o tempo de execução.';

  @override
  String get phoneResetDeletesEverything =>
      'chats, espaços de trabalho, plugins, configurações, configurações de interface e habilidades';

  @override
  String get phoneResetBodyEverything =>
      'Isto irá excluir chats, espaços de trabalho, plugins, configurações, configurações de interface e habilidades, em seguida, reinstalar o tempo de execução.';

  @override
  String phoneEngineStorageDetails(String needed, String free) {
    return 'Armazenamento insuficiente: aproximadamente $needed MB necessário, $free MB disponível';
  }

  @override
  String get phoneControlEnabledRestarting => 'On · Reiniciando o motor';

  @override
  String get phoneControlDisabledRestarting => 'Desligar · Reiniciar o motor';

  @override
  String get phoneControlEnabledPending => 'On · Faz efeito quando o motor liga';

  @override
  String get phoneReturnAfterDone => 'Voltar ao DSH Go quando terminar';

  @override
  String get phoneReturnAfterDoneHint => 'Fecha a barra, abre o chat';

  @override
  String get phoneFloatingBar => 'Barra flutuante';

  @override
  String get phoneIdleOpacity => 'Opacidade ociosa';

  @override
  String get phoneAutoCollapse => 'Recolher quando inactivo';

  @override
  String get phoneAutoCollapseHint => 'Encolher para uma bola; toque para abrir';

  @override
  String get phoneDeveloperOptions => 'Opções de desenvolvimento';

  @override
  String get phoneDirectEngine => 'Lançamento directo do motor local';

  @override
  String get phoneDirectHint =>
      'Experimental e desligado por padrão; aplica- se na próxima partida. Alguns telefones (Android 16, para um) bloqueiam um início direto, e o aplicativo então volta para lançamento compatível por conta própria. Seus dados não são afetados.';

  @override
  String get phoneDirectFailedHint =>
      'O lançamento direto não funcionou neste celular, então o lançamento compatível é usado. Pare o motor e ligue isto para tentar novamente.';

  @override
  String get phoneDirectCompatibleHint =>
      'Este início foi usado como lançamento compatível; a razão está acima. Sua escolha é mantida, e o próximo começo tente novamente.';

  @override
  String get phoneDirectStopFirst => 'Pare o motor local antes de alterar o seu método de lançamento.';

  @override
  String get phoneDirectSafeHint =>
      'Modo seguro usa lançamento compatível. Esta escolha aplica- se quando regressar ao modo normal.';

  @override
  String get phoneDirectNeedsRuntime => 'Esta opção precisa de um tempo de execução com suporte de lançamento direto.';

  @override
  String get phoneDirectChangeFailed =>
      'Não foi possível alterar o método de lançamento. Pare o motor local e tente novamente.';

  @override
  String get phoneActualLaunchMode => 'Lançamento atual';

  @override
  String get phoneLaunchNotObserved => 'Não em execução';

  @override
  String get phoneLastLaunchSelection => 'Último lançamento';

  @override
  String get phoneDirectRejectedReason => 'Razão de retrocesso';

  @override
  String get phoneLaunchFailureReason => 'Última falha';

  @override
  String get phoneReturnCompatible => 'Usar lançamento compatível';

  @override
  String get phoneLaunchDirect => 'Lançamento direto';

  @override
  String get phoneLaunchCompatible => 'Lançamento compatível';

  @override
  String get phoneDirectIncompatibleFiles =>
      'Arquivos de plug-in ainda não arrumados, lançamento compatível por enquanto';

  @override
  String get phoneDirectNotEnoughSpace => 'Armazenamento insuficiente, lançamento compatível por enquanto';

  @override
  String get phoneDirectMigrationFailed => 'Arranjo do arquivo inacabado, lançamento compatível por enquanto';

  @override
  String get phoneDirectLaunchFailed => 'Falha no lançamento direto';

  @override
  String get phoneLaunchStartFailed => 'Não acabei de começar.';

  @override
  String phoneLaunchExited(String code) {
    return 'Código de saída $code';
  }

  @override
  String get phoneTaskResultReady => 'Tarefa concluída · Ver o resultado';

  @override
  String get phoneTaskEndedResult => 'Tarefa terminada · Ver resultado';

  @override
  String get phoneBackgroundGuideTitle => 'Confirmações e devolução';

  @override
  String get phoneBackgroundGuideSubtitle => 'Veja confirmações e resultados da tarefa no tempo';

  @override
  String get phoneBackgroundGuideBody =>
      'Quando um passo precisa de sua decisão, um cartão DSH Go aparece. Se o cartão não estiver disponível, o aplicativo tente uma notificação ou retorna aqui. Permitir notificações de controle de telefone e alertas pop-up nas configurações do sistema.';

  @override
  String get phoneBackgroundOemHint =>
      'Nas permissões do sistema para o DSH Go, verifique “Exibir janelas pop-up enquanto executa em segundo plano”, se disponível. Permitir isso pode ajudar o aplicativo a retornar automaticamente. Os nomes dos menus variam de acordo com a versão do sistema.';

  @override
  String get phoneBackgroundReturnHint =>
      'Se o aplicativo não retornar quando uma tarefa terminar, toque em \"Tarefa completa · Ver resultado\". Se as notificações do sistema ou janelas de fundo estão bloqueadas, você pode precisar abrir o DSH Go você mesmo.';

  @override
  String get phoneBackgroundGotIt => 'Entendido.';

  @override
  String get phoneBackgroundOpenSettings => 'Abrir configurações do sistema';

  @override
  String get phoneBackgroundNotificationBlocked => 'Permitir alertas pop-up para notificações de controle de telefone';

  @override
  String get phoneModeTitle => 'Como o DSH confirma as ações';

  @override
  String get phoneModeMessage => 'Você pode alterar essa opção em Configurações a qualquer momento';

  @override
  String get phoneModeAsk => 'Perguntar nas etapas principais';

  @override
  String get phoneModeAskHint => 'Antes de abrir outro aplicativo, enviar, excluir ou pagar';

  @override
  String get phoneModeAuto => 'Totalmente automático';

  @override
  String get phoneModeAutoHint => 'Não pergunta nem interrompe';

  @override
  String get phoneModeAutoNoteTitle => 'Estas ações ficam com você';

  @override
  String get phoneModeAutoNote =>
      'Configurações e permissões do sistema, senhas, códigos de verificação e o próprio DSH Go continuam sob seu controle. Aplicativos bancários e de pagamento ficam bloqueados por padrão; você pode mudar isso em Configurações.';

  @override
  String get phoneModeAutoUnlockNote =>
      'Para permitir que a IA altere configurações do sistema e digite senhas, ative a opção em Configurações › Controle do celular › Suspender restrições.';

  @override
  String get phoneModeConfirmAuto => 'Usar modo totalmente automático';

  @override
  String get phoneYoursTitle => 'Estas ações ficam com você';

  @override
  String get phoneYoursSystem => 'Configurações e permissões do sistema';

  @override
  String get phoneYoursSecrets => 'Senhas e códigos de verificação';

  @override
  String get phoneYoursOwnApp => 'O próprio DSH Go';

  @override
  String get phoneYoursDenyList =>
      'Aplicativos marcados como restritos nas regras, incluindo bancos e pagamentos por padrão';

  @override
  String get phoneUnlockTitle => 'Suspender restrições';

  @override
  String get phoneUnlockSubtitle => 'Permitir que a IA faça ações normalmente reservadas a você';

  @override
  String get phoneUnlockSystem => 'Configurações do sistema';

  @override
  String get phoneUnlockSystemHint => 'Permissões, instaladores, central de segurança e notificações';

  @override
  String get phoneUnlockSecrets => 'Senhas e códigos';

  @override
  String get phoneUnlockSecretsHint => 'Digitar senhas e códigos de verificação e pagamento';

  @override
  String get phoneUnlockOwnApp => 'O próprio DSH Go';

  @override
  String get phoneUnlockOwnAppHint => 'Tocar e digitar dentro do DSH Go';

  @override
  String get phoneUnlockBusy => 'Não é possível ativar enquanto há uma tarefa em andamento';

  @override
  String get phoneUnlockFootnote =>
      'Ao ativar, você assume as consequências. Ative apenas quando necessário e desative ao terminar.';

  @override
  String get phoneUnlockBanks => 'Aplicativos bancários e de pagamento';

  @override
  String get phoneUnlockBanksHint => 'Alterar nas regras dos aplicativos';

  @override
  String get phoneUnlockNone => 'Nenhum ativado';

  @override
  String phoneUnlockCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count ativados', one: '1 ativado');
    return '$_temp0';
  }

  @override
  String get phoneUnlockedBadge => 'Restrições suspensas';

  @override
  String get phoneUnlockConfirmSystemTitle => 'Permitir que a IA altere configurações do sistema?';

  @override
  String get phoneUnlockConfirmSecretsTitle => 'Permitir que a IA digite senhas e códigos?';

  @override
  String get phoneUnlockConfirmOwnAppTitle => 'Permitir que a IA controle o DSH Go?';

  @override
  String get phoneUnlockCanTitle => 'Após ativar, a IA poderá';

  @override
  String get phoneUnlockRiskTitle => 'Possíveis riscos';

  @override
  String get phoneUnlockDisclaimerTitle => 'Aviso de responsabilidade';

  @override
  String get phoneUnlockSystemCan1 =>
      'Abrir e alterar configurações do sistema, incluindo permissões, acessibilidade e opções do desenvolvedor';

  @override
  String get phoneUnlockSystemCan2 => 'Instalar, atualizar ou desinstalar aplicativos';

  @override
  String get phoneUnlockSystemCan3 =>
      'Tocar na central de segurança e na área de notificações, inclusive nos botões das notificações';

  @override
  String get phoneUnlockSystemRisk1 =>
      'Instruções maliciosas em páginas, mensagens ou arquivos podem levar a IA a desativar proteções, conceder permissões a outros aplicativos ou instalar aplicativos';

  @override
  String get phoneUnlockSystemRisk2 =>
      'Você terá de restaurar configurações de rede, conta ou segurança alteradas por engano';

  @override
  String get phoneUnlockSecretsCan1 => 'Digitar em campos de senha e de códigos de verificação ou pagamento';

  @override
  String get phoneUnlockSecretsCan2 =>
      'Usar códigos vistos em conversas, mensagens ou notificações para entrar em contas ou confirmar ações';

  @override
  String get phoneUnlockSecretsCan3 => 'O registro de ações mostra ••••, sem revelar o que foi digitado';

  @override
  String get phoneUnlockSecretsRisk1 =>
      'Instruções maliciosas podem levar a IA a digitar um código em outro lugar e permitir acesso à sua conta';

  @override
  String get phoneUnlockSecretsRisk2 => 'Ela pode concluir um pagamento ou transferência que você não pretendia fazer';

  @override
  String get phoneUnlockOwnAppCan1 => 'Tocar e digitar no DSH Go, inclusive para mudar configurações';

  @override
  String get phoneUnlockOwnAppCan2 => 'Ler conversas e configurações exibidas no DSH Go';

  @override
  String get phoneUnlockOwnAppRisk1 =>
      'Instruções maliciosas podem levar a IA a aprovar suas próprias solicitações ou desativar confirmações';

  @override
  String get phoneUnlockOwnAppRisk2 => 'O conteúdo dessas telas é enviado ao modelo';

  @override
  String get phoneUnlockDisclaimer1 =>
      'Após a ativação, a IA pode realizar as ações acima sem confirmação de outra pessoa.';

  @override
  String get phoneUnlockDisclaimer2 => 'Conteúdo de páginas, mensagens ou arquivos pode induzir a IA ao erro.';

  @override
  String get phoneUnlockDisclaimer3 =>
      'Você assume qualquer perda decorrente em suas contas, dinheiro, dados ou dispositivo. O DSH Go e seus desenvolvedores não assumem responsabilidade.';

  @override
  String get phoneUnlockDisclaimer4 => 'Ative apenas quando necessário e desative ao terminar.';

  @override
  String get phoneUnlockDisclaimer5 => 'Não recomendamos ativar em dispositivos com dados bancários ou de pagamento.';

  @override
  String get phoneUnlockHold => 'Entendo os riscos; ativar';

  @override
  String get phoneUnlockHoldHint => 'Mantenha pressionado por cerca de 1,5 segundo';

  @override
  String phoneUnlockOnNotice(String name) {
    return '“$name” está ativado';
  }

  @override
  String phoneUnlockOffNotice(String name) {
    return '“$name” está desativado';
  }

  @override
  String get searchKwPhoneUnlock =>
      'suspender restrições,desbloquear,senhas,códigos,configurações do sistema,DSH Go,riscos,responsabilidade';

  @override
  String get pluginConfigUnsaved => 'Não salvo';

  @override
  String get pluginConfigSecretSet => 'Definir';

  @override
  String get pluginConfigAdvanced => 'Avançado';

  @override
  String get pluginConfigSearchHint => 'Pesquisar nas configurações';

  @override
  String get pluginConfigNoMatch => 'Sem configurações correspondentes';

  @override
  String get pluginConfigOpenWeb => 'Configurar na Web';

  @override
  String get pluginConfigOpenWebHint => 'Página própria do plugin';

  @override
  String get pluginConfigResetAll => 'Reiniciar tudo como padrão';

  @override
  String get pluginConfigResetAllTitle => 'Reiniciar tudo como padrão?';

  @override
  String get pluginConfigReset => 'Reiniciar';

  @override
  String pluginConfigChanges(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count alterações', one: '1 alteração');
    return '$_temp0';
  }

  @override
  String get pluginConfigAppliesOnReload => 'Salvando recarrega o plug-in';

  @override
  String get pluginConfigSaving => 'A gravar...';

  @override
  String get pluginConfigReloading => 'Recarregando...';

  @override
  String get pluginConfigApplied => 'Aplicado';

  @override
  String get pluginConfigFailed => 'Não fez efeito.';

  @override
  String get pluginConfigRestored => 'Configurações anteriores restauradas';

  @override
  String get pluginConfigStopped => 'Não fez efeito, e as configurações anteriores não puderam ser restauradas';

  @override
  String get pluginConfigRestore => 'Restaurar';

  @override
  String get pluginConfigDiscard => 'Descartar';

  @override
  String get pluginConfigNotStarted => 'O plugin não começou';

  @override
  String get pluginConfigNone => 'Nada a definir';

  @override
  String get pluginConfigInvalidOperation => 'Esta alteração não pode ser aplicada';

  @override
  String get pluginConfigGone => 'O plugin não está mais em execução. Refrescado.';

  @override
  String get pluginConfigUnknown => 'Ligação perdida. Configurações recarregadas.';

  @override
  String get pluginConfigUnsupported => 'Ainda não pode ser definido aqui.';

  @override
  String get pluginConfigSecretUnbound => 'Precisa de suporte a plugins';

  @override
  String get pluginConfigListFailed => 'Não foi possível ler a lista de plug-ins. Tente novamente mais tarde.';

  @override
  String get pluginConfigListUpdating => 'A lista de plug-ins está atualizando. Tente novamente daqui a pouco.';

  @override
  String get pluginConfigFixed => 'Definir por arquivo de configuração';

  @override
  String get pluginConfigFixedNote => 'Definir por um arquivo de configuração. Veja só aqui.';

  @override
  String get pluginConfigReadOnly => 'Somente leitura';

  @override
  String pluginConfigEntryTitle(String bundle, String entry) {
    return '$bundle · $entry';
  }

  @override
  String get pluginConfigNameSpeechToText => 'Reconhecimento de fala';

  @override
  String get pluginConfigNameSenseVoice => 'Reconhecimento de Voz de Sentido';

  @override
  String get pluginConfigNameSpeechApi => 'API de Transcrição';

  @override
  String get pluginConfigNameTranslator => 'Serviço de tradução';

  @override
  String get pluginConfigNameSessionIndex => 'Índice de sessão';

  @override
  String get pluginConfigNameSessionSearchTool => 'Ferramenta de pesquisa de sessão';

  @override
  String get pluginConfigNameTerminalService => 'Serviço de terminal';

  @override
  String get pluginConfigNameTerminalBash => 'Terminal Bash';

  @override
  String get pluginConfigNameTerminalPwsh => 'Terminal PowerShell';

  @override
  String get pluginConfigNameTerminalTools => 'Ferramentas de terminal';

  @override
  String get pluginConfigNameWorktree => 'Gestor de árvores de trabalho';

  @override
  String get pluginConfigNameWorktreeTools => 'Ferramentas de árvore de trabalho';

  @override
  String get pluginConfigNameRalphWorkflow => 'Motor de fluxo de trabalho';

  @override
  String get pluginConfigNameRalphTools => 'Ferramentas Ralph';

  @override
  String get plugInputRequired => 'Completar este campo';

  @override
  String get plugInputInvalidValue => 'Valor inválido';

  @override
  String get plugInputNumber => 'Digite um número válido';

  @override
  String plugInputBounds(String min, String max) {
    return 'Digite um valor de $min para $max';
  }

  @override
  String plugInputLength(int min, int max) {
    return 'Utilização $min–$max caracteres';
  }

  @override
  String get plugInputPattern => 'Verificar o formato';

  @override
  String get plugInputDate => 'Escolha uma data válida';

  @override
  String get plugInputTime => 'Escolha uma hora válida';

  @override
  String get plugInputUnavailable => 'Este componente não é suportado aqui';

  @override
  String get plugInputNoPassword => 'Os plug-ins não podem usar campos de senha';

  @override
  String get plugInputBadBinding => 'A ligação de entrada deve ser um caminho de campo sob dados';

  @override
  String get plugInputDuplicateBinding => 'Cada campo pode ligar-se a apenas uma entrada';

  @override
  String get plugInputNamedPattern => 'Usar um padrão de validação incorporado';

  @override
  String get plugInputNestedForm => 'Formas não podem ser aninhadas';

  @override
  String get plugInputSubmitMissing => 'O formulário precisa de uma ação de submissão';

  @override
  String get plugInputTooLarge => 'Muito contente. Encurta-o e tente novamente.';

  @override
  String get plugInputCheckFields => 'Verificar os campos realçados';

  @override
  String get plugInputFailed => 'Não salvo. Tente novamente.';

  @override
  String get plugInputSubmit => 'Gravar';

  @override
  String get plugInputChoose => 'Escolher';

  @override
  String get plugInputPrevious => 'Anterior';

  @override
  String get plugInputNext => 'Próxima';

  @override
  String plugInputDecrease(String label) {
    return 'Diminuir $label';
  }

  @override
  String plugInputIncrease(String label) {
    return 'Aumentar $label';
  }

  @override
  String plugInputRating(String label, int value, int max) {
    return '$label: $value fora de $max';
  }

  @override
  String get plugInputFormula => 'Limite de fórmula ou fórmula inválido excedido';

  @override
  String get plugInputDatePicker => 'Data do plug-in';

  @override
  String get plugInputTimePicker => 'Hora do plug-in';

  @override
  String get plugInputChoices => 'Opções do plug-in';

  @override
  String get plugInputGestureRequired => 'Este efeito requer um toque de usuário';

  @override
  String get pluginsOperationHostChanged => 'O hospedeiro mudou — nada foi feito';

  @override
  String get pluginsReloadLocal => 'Reiniciar o motor para recarregar';

  @override
  String get pluginsReloadInterrupts => 'Interrompe a execução de tarefas';

  @override
  String pluginsReloadConfirm(String name) {
    return 'Recarregar “$name”?';
  }

  @override
  String get pluginsReloadExplanation =>
      'Isto reinicia o motor local e recarrega os plugins. As tarefas de execução serão interrompidas.';

  @override
  String get pluginsReloadProceed => 'Reiniciar e recarregar';

  @override
  String get pluginsReloadRequested => 'Reiniciar o motor solicitado';

  @override
  String get pluginsReloadChanged => 'O estado da máquina ou plugin foi alterado. Tente novamente.';

  @override
  String get pluginsReloadFailed => 'Não foi possível reiniciar o motor. Verifica os registros.';

  @override
  String get pluginsFile => 'Arquivo';

  @override
  String get pluginsChat => 'Conversar';

  @override
  String get pluginsImage => 'Imagem';

  @override
  String get pluginsNamespaceDefaultModel => 'Modelo padrão';

  @override
  String get pluginsNamespaceDefaultPreset => 'Predefinição padrão';

  @override
  String get pluginsNamespaceAgent => 'Agente';

  @override
  String get pluginsNamespaceSubagent => 'Subagente';

  @override
  String get pluginsNamespaceSubagentModels => 'Modelos de subagentes';

  @override
  String get pluginsNamespaceDeepSeekModel => 'Modelo DeepSeek';

  @override
  String get pluginsNamespaceAccountModel => 'Modelo de conta DeepSeek';

  @override
  String get pluginsNamespaceCustomModels => 'Serviço de modelo personalizado';

  @override
  String get pluginsNamespaceNetwork => 'Acesso à Internet';

  @override
  String get pluginsNamespaceWebSearch => 'Pesquisa Web';

  @override
  String get pluginsNamespaceSearchApi => 'API de pesquisa Web';

  @override
  String get pluginsNamespaceCommands => 'Execução de comandos';

  @override
  String get pluginsNamespacePermissions => 'Permissões';

  @override
  String get pluginsNamespaceChatLog => 'Registo de conversas';

  @override
  String get pluginsNamespaceThinkingTranslation => 'Pensar na tradução';

  @override
  String get pluginsNamespaceTranslation => 'Tradução';

  @override
  String get pluginsNamespaceLanguage => 'Língua';

  @override
  String get pluginsNamespaceWebAppearance => 'Aparência na Web';

  @override
  String get pluginsNamespaceWebChat => 'Conversa na Web';

  @override
  String get pluginsNamespaceWebInput => 'Entrada Web';

  @override
  String get pluginsNamespaceWebSettings => 'Configuração da Web';

  @override
  String get pluginsNamespaceWebGeneral => 'Geral da Web';

  @override
  String get pluginsNamespaceAutoReview => 'Revisão automática';

  @override
  String get pluginsNamespaceAgentTeam => 'Equipa de agentes';

  @override
  String get pluginsNamespaceVoiceInput => 'Entrada de voz';

  @override
  String get pluginsOfficialPlugin => 'Plug- in oficial';

  @override
  String get pluginsLocalUnshareable => 'Instalado localmente, não é possível compartilhar';

  @override
  String pluginsIncludesPresets(String names) {
    return 'Inclui predefinições “$names”';
  }

  @override
  String get pluginsSecretsUnshareable => 'Contém segredos, não pode compartilhar';

  @override
  String pluginsLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count linhas', one: '1 linha');
    return '$_temp0';
  }

  @override
  String get pluginsEmptyValue => 'Vazio';

  @override
  String get pluginsOnValue => 'Ligado';

  @override
  String get pluginsOffValue => 'Desligado';

  @override
  String get pluginsOfficialUnavailable => 'Esta máquina não tem este plugin oficial';

  @override
  String get pluginsEnabled => 'Activado';

  @override
  String get pluginsVersionMismatch => 'A versão difere da versão compartilhada';

  @override
  String get pluginsCurrentVersion => 'Versão actual';

  @override
  String get pluginsNewVersion => 'Nova versão';

  @override
  String pluginsAddedWith(String title) {
    return 'Adicionado com “$title”';
  }

  @override
  String pluginsApplyAfterInstall(String detail) {
    return 'Aplicar após instalar plugins · $detail';
  }

  @override
  String get pluginsSettingsReadFailed => 'Não foi possível ler as configurações desta máquina';

  @override
  String get pluginsSettingUnavailable => 'Esta máquina não tem esta configuração';

  @override
  String get pluginsSettingsReadOnly => 'As configurações desta máquina são somente de leitura';

  @override
  String get pluginsImportLocalOnly => 'Só pode importar para este celular';

  @override
  String get pluginsReplaceSkill => 'Substituir a habilidade pelo mesmo nome';

  @override
  String get pluginsReplaceContent => 'Substituir o conteúdo existente';

  @override
  String get pluginsSafeModeInstallBlocked => 'Não é possível instalar plugins em modo seguro';

  @override
  String get pluginsHostInstallBlocked => 'Não é possível instalar plugins nesta máquina a partir daqui';

  @override
  String get pluginsInstallFailed => 'A instalação falhou';

  @override
  String get pluginsAfterRestart => 'Faz efeito após reiniciar';

  @override
  String get pluginsSettingsChanged => 'Configurações apenas alteradas';

  @override
  String get pluginsWriteFailed => 'Não foi possível escrever';

  @override
  String get pluginsHostUnreachable => 'Não é possível alcançar o host';

  @override
  String get pluginsFileWriteFailed => 'Não foi possível gravar o arquivo';

  @override
  String get pluginsProfileTitle => 'DSH Configuração do Go';

  @override
  String get pluginsGistTokenInvalid => 'O token do GitHub é inválido ou carece de permissão do Gist';

  @override
  String pluginsGistCreateHttpFailed(int status) {
    return 'Não foi possível criar o Gist (HTTP $status)';
  }

  @override
  String get pluginsGistCreateFailed => 'Não foi possível criar o Gist';

  @override
  String get pluginsGitHubUnreachable => 'Não é possível chegar ao GitHub';

  @override
  String get pluginsGitHubTimeout => 'A ligação ao GitHub terminou o tempo- limite';

  @override
  String get pluginsGistNotFound => 'Gist não encontrado';

  @override
  String get pluginsGistNoProfile => 'Este Gist não tem configurações para importar';

  @override
  String get pluginsGistReadFailed => 'Não foi possível ler o Gist';

  @override
  String get pluginsListReadFailed => 'Não foi possível ler a lista de plugins';

  @override
  String get pluginsReadingPlugins => 'A ler os \'plugins\'...';

  @override
  String get pluginsDshOfficial => 'Oficial DSH';

  @override
  String get pluginsOfficialToggleOnly =>
      'Componentes oficiais só podem ser ativados ou desligados e aplicar a todas as conversas neste host';

  @override
  String get pluginsOfficial => 'Oficial';

  @override
  String get pluginsNoThirdParty => 'Nenhum plug- in de terceiros ainda';

  @override
  String get pluginsPluginsDescription => 'Adicione ferramentas, memória e modelos ao DSH';

  @override
  String get pluginsBrowseMarket => 'Navegar em plug-ins';

  @override
  String get pluginsLoading => 'Carregando';

  @override
  String get pluginsIslandClosed => 'Interface de plug-in fechada';

  @override
  String get pluginsReopen => 'Abrir de novo';

  @override
  String pluginsOpenBrowserHost(String host) {
    return 'Abrir $host no seu navegador?';
  }

  @override
  String get pluginsSearch => 'Plug-ins de pesquisa';

  @override
  String get pluginsMarketLoading => 'Carregando diretório de plug-ins...';

  @override
  String get pluginsMarketLoadFailed => 'Não foi possível abrir o diretório do plugin';

  @override
  String get pluginsMarketInvalid => 'Formato de diretório inválido';

  @override
  String get pluginsAll => 'Tudo';

  @override
  String pluginsMarketCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count plugins', one: '1 plugin');
    return '$_temp0 · de dshfind';
  }

  @override
  String get pluginsHideWeb => 'Ocultar plug-ins Web';

  @override
  String pluginsShowWebCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mostrar $count Plug- ins Web',
      one: 'Mostrar 1 plug- in Web',
    );
    return '$_temp0';
  }

  @override
  String get pluginsNoCategoryPlugins => 'Sem plug-ins nesta categoria';

  @override
  String pluginsNoSearchResults(String query) {
    return 'Não existem resultados para “$query”';
  }

  @override
  String pluginsFailureDetails(String title) {
    return '$title · Toque em para visualizar';
  }

  @override
  String get pluginsFeatured => 'Recomendado';

  @override
  String pluginsInstalledRemoteRestart(String name, String host) {
    return 'Instalado “$name”. Reiniciar o DSH ligado $host aplicar.';
  }

  @override
  String pluginsInstalledNamed(String name) {
    return 'Instalado “$name”';
  }

  @override
  String get pluginsInstallCancelled => 'Instalação cancelada';

  @override
  String pluginsInstallFailureNamed(String name, String reason) {
    return '“$name” $reason';
  }

  @override
  String get pluginsRestartRequired => 'É necessário reiniciar o motor';

  @override
  String pluginsRestartExplanation(String name) {
    return 'Reiniciar o motor para aplicar “${name}As respostas em progresso serão interrompidas.';
  }

  @override
  String get pluginsRestartEngine => 'Reiniciar o motor';

  @override
  String get pluginsAllowBuildScripts => 'Permitir scripts de compilação?';

  @override
  String get pluginsBuildScriptPackages => 'Estes pacotes executam scripts durante a instalação:';

  @override
  String pluginsBuildScriptWarning(String host) {
    return 'Os programas são executados com as permissões do DSH ligadas $host e pode ler e escrever arquivos e acessar a internet. Só permite isso se você confiar no plugin.';
  }

  @override
  String get pluginsThisDevice => 'Este dispositivo';

  @override
  String get pluginsAllowRetry => 'Permitir e tentar novamente';

  @override
  String pluginsUpdateNamed(String name) {
    return 'Atualização “$name”?';
  }

  @override
  String pluginsUninstallNamed(String title) {
    return 'Desinstalar “$title”?';
  }

  @override
  String pluginsUninstallExplanation(String host) {
    return 'O plugin será removido de $host. Seus dados e configurações permanecerão.';
  }

  @override
  String get pluginsThisHost => 'Esta máquina';

  @override
  String get pluginsUninstall => 'Desinstalar';

  @override
  String pluginsUninstalledNamed(String title) {
    return 'Desinstalado “$title”';
  }

  @override
  String get pluginsRestartNow => 'Reiniciar agora';

  @override
  String get pluginsUninstallFailed => 'Não foi possível desinstalar';

  @override
  String get pluginsThatComputer => 'Aquele computador.';

  @override
  String get pluginsCommandAfterInstall => 'Depois de instalar, reinicie o DSH nesse computador e refresque aqui';

  @override
  String get pluginsError => 'Erro';

  @override
  String get pluginsInventoryTitle => 'Inventário de plug-ins';

  @override
  String get pluginsGlobalPlugins => 'Plug-ins globais';

  @override
  String get pluginsAgentPresets => 'Predefinições do agente';

  @override
  String get pluginsInventoryReadFailed => 'Não foi possível ler o inventário do plugin';

  @override
  String pluginsComponentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count componentes', one: '1 componente');
    return '$_temp0';
  }

  @override
  String pluginsEnabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count habilitado', one: '1 habilitado');
    return '$_temp0';
  }

  @override
  String pluginsErrorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count erros', one: '1 erro');
    return '$_temp0';
  }

  @override
  String get pluginsNoPlugins => 'Sem plug-ins';

  @override
  String get pluginsNoMatchingPlugins => 'Sem \'plugins\' correspondentes';

  @override
  String get pluginsPresetLoadFailed => 'Não foi possível carregar esta predefinição';

  @override
  String get pluginsPresetNoPlugins => 'Esta predefinição não tem plug-ins';

  @override
  String get pluginsStandard => 'Padrão';

  @override
  String get pluginsMinimal => 'Mínimo';

  @override
  String pluginsDefaultPresetName(String name) {
    return '$name (padrão)';
  }

  @override
  String get pluginsSystemComponents => 'Componentes do sistema';

  @override
  String pluginsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count itens', one: '1 ponto');
    return '$_temp0';
  }

  @override
  String get pluginsSource => 'Origem';

  @override
  String get pluginsDisableCondition => 'Desactivado quando';

  @override
  String get pluginsProvidedByPreset => 'Fornecido por predefinição';

  @override
  String get pluginsDetailsTitle => 'Detalhes do plug-in';

  @override
  String pluginsPackageInfoError(String error) {
    return 'Informação do pacote inválida: $error';
  }

  @override
  String get pluginsInstalling => 'Instalar';

  @override
  String get pluginsGet => 'Obter';

  @override
  String get pluginsLoadingCannotCancel => 'Carregando o plugin. Este passo não pode ser cancelado.';

  @override
  String get pluginsInstallDuration => 'Leva um minuto ou dois. Pode deixar esta página.';

  @override
  String get pluginsViewInstallLogs => 'Ver os registros de instalação';

  @override
  String get pluginsViewDetails => 'Ver detalhes';

  @override
  String get pluginsCopyCommand => 'Copiar o comando';

  @override
  String get pluginsCommandCopied => 'Comando copiado';

  @override
  String get pluginsMissingFiles => 'Faltam arquivos de plug-in. Reinstalar para corrigir.';

  @override
  String get pluginsNotDshPlugin => 'Não é um plugin DSH, não pode carregar';

  @override
  String get pluginsIncompatible => 'Incompatível com esta versão DSH, não carregada';

  @override
  String pluginsRequiresDshVersion(String requiredVersion, String currentVersion) {
    return 'Requer DSH $requiredVersion, actualmente $currentVersion, não carregado';
  }

  @override
  String pluginsLoadFailure(String reason) {
    return 'Não foi possível carregar: $reason';
  }

  @override
  String get pluginsUnknownReason => 'Razão desconhecida';

  @override
  String pluginsBundleProblem(String reason) {
    return 'Problema: $reason';
  }

  @override
  String pluginsRefreshFailure(String reason) {
    return 'Não foi possível atualizar: $reason';
  }

  @override
  String get pluginsTitle => 'Plugins';

  @override
  String get pluginsRefresh => 'Atualizar';

  @override
  String get pluginsMarketTitle => 'Mercado de plug-ins';

  @override
  String get pluginsConnectToManage => 'Conecte-se ao motor para gerenciar plug-ins';

  @override
  String get pluginsSafeModeOperationsBlocked => 'Não é possível instalar ou desinstalar plugins em modo seguro';

  @override
  String pluginsRelayToggleOnly(String host) {
    return '$host · A transmissão só suporta ligar ou desligar plugins. Instale nesse computador.';
  }

  @override
  String get pluginsInstallThisPhone => 'Instalar em: Este celular';

  @override
  String pluginsInstallHost(String host) {
    return 'Instalar em: $host';
  }

  @override
  String get pluginsOfflineDescription =>
      'Plug-ins instalados aparecem quando o motor está funcionando. Você pode navegar no mercado agora.';

  @override
  String get pluginsIconChanged => 'O ícone mudou. A sua tela inicial é atualizada em poucos segundos.';

  @override
  String get pluginsIconChangeFailed => 'Não foi possível alterar o ícone. Tente novamente mais tarde.';

  @override
  String get pluginsTheme => 'Tema';

  @override
  String get pluginsAppearance => 'Aparência';

  @override
  String get pluginsColors => 'Cores';

  @override
  String get pluginsFeatureIcons => 'Ícones de recurso';

  @override
  String get pluginsAppIcon => 'Ícone da aplicativo';

  @override
  String get pluginsPet => 'Mascote';

  @override
  String get pluginsCustomColor => 'Personalizado';

  @override
  String pluginsColorLabel(String label) {
    return 'Cor: $label';
  }

  @override
  String get pluginsCoral => 'Coral';

  @override
  String get pluginsRouge => 'Rouge';

  @override
  String get pluginsOchre => 'Ocre';

  @override
  String get pluginsMoss => 'Musgo';

  @override
  String get pluginsLake => 'Lago';

  @override
  String get pluginsIndigo => 'Indigo';

  @override
  String get pluginsHue => 'Matiz';

  @override
  String get pluginsWallpaper => 'Papel de parede';

  @override
  String get pluginsFollowWallpaper => 'Usar as cores do papel de parede';

  @override
  String get pluginsAllowHighPower => 'Permitir o uso de alta potência de fundo';

  @override
  String pluginsVivoBatteryPath(String app) {
    return 'Bateria › Gestão do consumo de energia de fundo › $app';
  }

  @override
  String get pluginsXiaomiBatterySetting => 'Salvador de bateria: Sem restrições';

  @override
  String pluginsXiaomiBatteryPath(String app) {
    return 'Gerenciar aplicativos › $app › Poupança de bateria';
  }

  @override
  String get pluginsHuaweiBatterySetting => 'Permitir atividade de fundo';

  @override
  String pluginsHuaweiBatteryPath(String app) {
    return 'Bateria › Lançamento do aplicativo › $app';
  }

  @override
  String get pluginsOppoBatterySetting => 'Permitir atividade de fundo';

  @override
  String pluginsOppoBatteryPath(String app) {
    return 'Bateria › Gerenciamento de baterias de aplicativos › $app';
  }

  @override
  String get pluginsSamsungBatterySetting => 'Bateria: Sem restrições';

  @override
  String pluginsSamsungBatteryPath(String app) {
    return 'Aplicativos › $app › Bateria';
  }

  @override
  String get pluginsVivoBatteryStep => 'Ligar “Permitir o uso de alta potência de fundo”';

  @override
  String pluginsXiaomiBatteryFullPath(String app) {
    return 'Configurações do aplicativo › Gerenciar aplicativos › $app › Salvador de bateria › Sem restrições';
  }

  @override
  String get pluginsXiaomiAutostart => 'Ligar \"Autostart\" na mesma página';

  @override
  String get pluginsHuaweiBatteryStep => 'Desligue “Gerenciar automaticamente” e ligue “Permitir atividade de fundo”';

  @override
  String get pluginsOppoBatteryStep => 'Ligue “Permitir atividade de fundo”';

  @override
  String get pluginsSamsungBatteryStep => 'Selecione \"Sem restrições\"';

  @override
  String get pluginsBackgroundTitle => 'Fundo em execução';

  @override
  String get pluginsBackgroundDescription => 'Deixe as conversas terminarem em segundo plano';

  @override
  String get pluginsSystem => 'Sistema';

  @override
  String get pluginsSystemBatteryOptimization => 'Otimização da bateria do sistema';

  @override
  String get pluginsTurnedOff => 'Desligado';

  @override
  String get pluginsNotTurnedOff => 'Ligado';

  @override
  String get pluginsStayOnline => 'Mantenha-se online';

  @override
  String get pluginsKeepEngineNotification => 'Mantenha a notificação “Engine running”';

  @override
  String pluginsLockInRecents(String app) {
    return 'Bloquear $app em aplicativos recentes';
  }

  @override
  String get pluginsPhoneBrands => 'Marcas telefónicas';

  @override
  String get pluginsOtherBrands => 'Outras marcas';

  @override
  String pluginsConnectedHost(String host) {
    return 'Ligado ($host)';
  }

  @override
  String pluginsConnectionError(String error) {
    return 'Não foi possível conectar: $error';
  }

  @override
  String get pluginsConnecting => 'Conectando';

  @override
  String get pluginsDiagnosticsCopied => 'Diagnóstico copiado';

  @override
  String get pluginsDiagnostics => 'Diagnósticos';

  @override
  String get pluginsDiagnosticsDescription => 'Incluir com relatórios de erros. Sem chaves ou fichas de API.';

  @override
  String get pluginsRuntime => 'Tempo de execução';

  @override
  String get pluginsArchitecture => 'Arquitetura';

  @override
  String get pluginsBundledVersion => 'Versão agrupada';

  @override
  String get pluginsInstalledVersion => 'Versão instalada';

  @override
  String get pluginsErrorLabel => 'Erro';

  @override
  String get pluginsConnection => 'Ligação';

  @override
  String get pluginsAddress => 'Endereço';

  @override
  String get pluginsClient => 'Cliente';

  @override
  String get pluginsConfigured => 'Definir';

  @override
  String get pluginsExport => 'Exportação';

  @override
  String get pluginsCopyDiagnostics => 'Copiar diagnósticos';

  @override
  String get pluginsDiagnosticsContents => 'Apenas versões e status de conexão';

  @override
  String get pluginsNotificationsPartlyBlocked => 'Alguns bloqueados pelo sistema';

  @override
  String get pluginsNotificationsBlocked => 'Bloqueado pelo sistema';

  @override
  String get pluginsTurnedOn => 'Ligado';

  @override
  String get pluginsNotifications => 'Notificação';

  @override
  String get pluginsNotificationSettingsFailed =>
      'Não foi possível abrir as configurações do sistema. Ligue notificações em Configurações → Apps → DSH Go → Notificações.';

  @override
  String get pluginsSystemNotificationsOff => 'As notificações do sistema estão desligadas';

  @override
  String get pluginsBackgroundNoAlerts => 'Você não vai receber alertas enquanto o aplicativo está no fundo';

  @override
  String get pluginsApprovalNotificationsOff => 'As notificações “necessárias de aprovação” estão desligadas';

  @override
  String get pluginsBackgroundNoApprovalAlerts =>
      'Você não receberá alertas de aprovação enquanto o aplicativo está em segundo plano';

  @override
  String get pluginsDoneNotificationsOff => 'As notificações “Virado terminado” estão desligadas';

  @override
  String get pluginsBackgroundNoDoneAlerts =>
      'Você não vai obter a conclusão ou alertas de erro enquanto o aplicativo está em segundo plano';

  @override
  String get pluginsTurnOn => 'Ligar';

  @override
  String get pluginsNotificationsDescription => 'Obter alertas quando as conversas terminarem ou precisarem de si';

  @override
  String get pluginsAllowNotifications => 'Permitir notificações';

  @override
  String get pluginsNotificationsAndBanners => 'Notificações do sistema e banners superiores';

  @override
  String get pluginsAlerts => 'Alertas';

  @override
  String get pluginsRemoteAlertsRequirement => 'Alertas de host remotos precisam do aplicativo em execução e conectado';

  @override
  String get pluginsTurnComplete => 'Rodada completo';

  @override
  String get pluginsReplyPreview => 'Incluir o início da resposta';

  @override
  String get pluginsErrorOrStopped => 'Erro ou parado';

  @override
  String get pluginsErrorOrStoppedDescription => 'A solicitação falhou, o motor foi reiniciado ou parou';

  @override
  String get pluginsApprovalDescription => 'Aprovação necessária para executar comandos, editar arquivos e muito mais';

  @override
  String get pluginsQuestions => 'Perguntas para si';

  @override
  String get pluginsQuestionsDescription => 'IA precisa da sua resposta';

  @override
  String get pluginsSystemSettings => 'Configuração do sistema';

  @override
  String get pluginsLockScreenPrivacy => 'O conteúdo do chat permanece oculto na tela de bloqueio';

  @override
  String get pluginsSoundBannerLockScreen => 'Som, banners e tela de bloqueio';

  @override
  String get pluginsEnableFloatingNotifications => 'Ativar “Notificações flutuantes” se os banners não aparecerem';

  @override
  String get pluginsPersonalPreferences => 'Preferências pessoais';

  @override
  String get pluginsPreferencesDescription => 'Novas conversas seguirão estas instruções';

  @override
  String get pluginsPreferencesHint => 'Por exemplo: Reply in Chinese. Eu escrevo principalmente Flutter.';

  @override
  String get pluginsSaving => 'Salvando';

  @override
  String get pluginsShareLink => 'Compartilhar a ligação';

  @override
  String get pluginsInstallPlugin => 'Instalar plug-in';

  @override
  String get pluginsImportProfile => 'Configuração da importação';

  @override
  String get pluginsImportTo => 'Importar para';

  @override
  String get pluginsInstallTo => 'Instalar para';

  @override
  String get pluginsVerification => 'Verificação';

  @override
  String get pluginsSize => 'Tamanho';

  @override
  String get pluginsVerified => 'Verificado';

  @override
  String get pluginsVerificationMismatch => 'Erro de verificação';

  @override
  String get pluginsCannotVerify => 'Não é possível verificar';

  @override
  String get pluginsVerifying => 'Verificando';

  @override
  String get pluginsPresets => 'Predefinições';

  @override
  String get pluginsSkills => 'Habilidades';

  @override
  String get pluginsAdded => 'Adicionado';

  @override
  String get pluginsModified => 'Modificado';

  @override
  String get pluginsNoChanges => 'Não são necessárias alterações';

  @override
  String get pluginsUnavailable => 'Indisponível';

  @override
  String get pluginsHostProfileReadFailed => 'Não foi possível ler as configurações desta máquina';

  @override
  String get pluginsAlreadyMatches => 'Esta máquina já corresponde';

  @override
  String get pluginsUnsuccessful => 'Falha';

  @override
  String get pluginsSkipped => 'Saltado';

  @override
  String get pluginsView => 'Inspecionar';

  @override
  String get pluginsImport => 'Importar';

  @override
  String get pluginsHostPluginsReadFailed => 'Não foi possível ler os plugins desta máquina';

  @override
  String pluginsUpdateTo(String version) {
    return 'Atualizar para $version';
  }

  @override
  String pluginsImportCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Importar $count itens',
      one: 'Importar 1 item',
    );
    return '$_temp0';
  }

  @override
  String get pluginsImporting => 'Importação';

  @override
  String get pluginsInstallingActive => 'Instalar';

  @override
  String pluginsImportFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count os itens falharam',
      one: '1 item falhou',
    );
    return '$_temp0';
  }

  @override
  String get pluginsCouldNotInstall => 'Não foi possível instalar';

  @override
  String get pluginsEngineRestartToApply => 'Reiniciar o motor a aplicar';

  @override
  String pluginsRemoteRestartToApply(String host) {
    return 'Reiniciar o DSH ligado $host a aplicar';
  }

  @override
  String pluginsImportedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Importado $count itens',
      one: 'Importado 1 item',
    );
    return '$_temp0';
  }

  @override
  String get pluginsLocalPluginUnshareable => 'Este plugin foi instalado localmente e não pode ser compartilhado';

  @override
  String get pluginsSharePlugin => '\'Plugin\' de compartilhamento';

  @override
  String pluginsPluginCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count plugins', one: '1 plugin');
    return '$_temp0';
  }

  @override
  String pluginsSettingsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count configurações', one: '1 ajuste');
    return '$_temp0';
  }

  @override
  String pluginsPresetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count predefinições',
      one: '1 predefinido',
    );
    return '$_temp0';
  }

  @override
  String pluginsSkillCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count competências', one: '1 habilidade');
    return '$_temp0';
  }

  @override
  String get pluginsNothingSelected => 'Nada selecionado';

  @override
  String get pluginsNext => 'Próxima';

  @override
  String get pluginsNothingToShare => 'Nada para compartilhar';

  @override
  String get pluginsProfileReadFailed => 'Não foi possível ler as configurações';

  @override
  String get pluginsShareProfile => 'Compartilhar a configuração';

  @override
  String pluginsFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count arquivos', one: '1 arquivo');
    return '$_temp0';
  }

  @override
  String get pluginsShareNeedsUpdate => 'Atualizar a aplicativo para abrir isto';

  @override
  String get pluginsShareUnusable => 'Este código de compartilhamento não pode ser usado';

  @override
  String get pluginsShareDamaged => 'Este código de compartilhamento está incompleto ou danificado';

  @override
  String get pluginsShareFileReadFailed => 'Não foi possível ler este arquivo';

  @override
  String get pluginsShareOpenFailed => 'Não foi possível abrir este código de compartilhamento';

  @override
  String get pluginsPluginShareTitle => 'DSH Go plug-in';

  @override
  String get pluginsShareSheetOpenFailed => 'Não foi possível abrir o compartilhamento';

  @override
  String get pluginsSavePermissionDenied => 'Não foi possível salvar sem permissão de armazenamento';

  @override
  String get pluginsQrCode => 'Código QR';

  @override
  String get pluginsSaveAsFile => 'Gravar como arquivo';

  @override
  String get pluginsGistLinkReady => 'Ligação Gist criada';

  @override
  String get pluginsTooLargeShareFile => 'Muito contente. Compartilhar como um arquivo.';

  @override
  String get pluginsGenerateLink => 'Criar um link';

  @override
  String get pluginsGitHubToken => 'GitHub token';

  @override
  String get pluginsGistPermissionNeeded => 'É necessária a permissão da gist';

  @override
  String get pluginsGenerateGistLink => 'Criar um link Gist';

  @override
  String get pluginsShareQrCode => 'Código de compartilhamento Código QR';

  @override
  String pluginsUpdateCurrentWarning(String to) {
    return 'A versão atual será desinstalada, então $to instalado. Se a instalação falhar, o plugin precisará ser reinstalado.';
  }

  @override
  String pluginsUpdateVersionWarning(String from, String to) {
    return '$from será desinstalado, então $to instalado. Se a instalação falhar, o plugin precisará ser reinstalado.';
  }

  @override
  String pluginsUninstalledRestartLocal(String title) {
    return 'Desinstalado “$title\". Reinicie o motor para terminar de removê-lo.';
  }

  @override
  String pluginsUninstalledRestartRemote(String title, String host) {
    return 'Desinstalado “$title”. Reiniciar o DSH ligado $host para acabar de removê-lo.';
  }

  @override
  String get pluginsEnableFailed => 'Não foi possível ativar';

  @override
  String get pluginsDisableFailed => 'Não foi possível desativar';

  @override
  String get pluginsEnabledRestartLocal => 'Activado. Reiniciar o motor para aplicar.';

  @override
  String pluginsEnabledRestartRemote(String host) {
    return 'Activado. Reiniciar o DSH ligado $host aplicar.';
  }

  @override
  String get pluginsDisabledRestartLocal => 'Deficiente. Reiniciar o motor para aplicar.';

  @override
  String pluginsDisabledRestartRemote(String host) {
    return 'Deficiente. Reiniciar o DSH ligado $host aplicar.';
  }

  @override
  String pluginsRelayCommandInstruction(String host) {
    return 'O DSH Remote só suporta ligar ou desligar plugins. Executa isto num terminal $host:';
  }

  @override
  String get pluginsPermissionLocalThirdParty =>
      'Os plug-ins são executados com as permissões do DSH: eles podem ler e escrever arquivos, executar comandos e ler as chaves da API e o armazenamento do telefone que você concedeu acesso. Eles não são restritos pela caixa de areia do espaço de trabalho. Fornecido por um terceiro e não revisto pelo DSH.';

  @override
  String get pluginsPermissionLocalTrusted =>
      'Os plug-ins são executados com as permissões do DSH: eles podem ler e escrever arquivos, executar comandos e ler as chaves da API e o armazenamento do telefone que você concedeu acesso. Eles não são restritos pela caixa de areia do espaço de trabalho. Apenas instale plugins em que você confia.';

  @override
  String get pluginsPermissionRemoteThirdParty =>
      'Plugins são executados com as permissões do DSH: eles podem ler e escrever arquivos, executar comandos e ler teclas API. Eles não são restritos pela caixa de areia do espaço de trabalho. Fornecido por um terceiro e não revisto pelo DSH.';

  @override
  String get pluginsPermissionRemoteTrusted =>
      'Plugins são executados com as permissões do DSH: eles podem ler e escrever arquivos, executar comandos e ler teclas API. Eles não são restritos pela caixa de areia do espaço de trabalho. Apenas instale plugins em que você confia.';

  @override
  String pluginsSelectedQrCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens selecionados',
      one: '1 item selecionado',
    );
    return '$_temp0 · Código QR disponível';
  }

  @override
  String pluginsSelectedFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens selecionados',
      one: '1 item selecionado',
    );
    return '$_temp0 · Compartilhar como um arquivo';
  }

  @override
  String get pluginsListSeparator => ', ';

  @override
  String pluginsActionFailure(String action, String reason) {
    return '$action: $reason';
  }

  @override
  String pluginsInventorySemantics(String title, String status) {
    return '$title, $status';
  }

  @override
  String pluginsSettingsChanges(String shown, int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count itens', one: '1 ponto');
    return '$shown e mais · $_temp0';
  }

  @override
  String get pluginsLoadStatus => 'Estado da carga';

  @override
  String get pluginsLoadPartial => 'Parcialmente ativo';

  @override
  String get pluginsLoadFailed => 'O carregamento falhou';

  @override
  String get pluginsLoadNotReady => 'Não pronto';

  @override
  String get pluginsLoadMetadata => 'Diagnóstico de metadados';

  @override
  String pluginsLoadRunningCount(int running, int total) {
    return '$running de $total componentes em execução';
  }

  @override
  String get pluginsLoadUnreported => 'Não comunicado';

  @override
  String get pluginsLoadNoRuntimeDetail =>
      'A máquina não devolveu os detalhes do erro de execução. Verifica os registros do motor.';

  @override
  String get pluginsLoadRemoteLogs => 'Verifiquem os registros do motor desta máquina.';

  @override
  String get plugslotsSurfaceComposerActions => 'Botões de composição';

  @override
  String get plugslotsSurfaceMessageActions => 'Menu de mensagens';

  @override
  String get plugslotsSurfaceComposerStrip => 'Linha de status';

  @override
  String get plugslotsSurfacePanel => 'Painéis';

  @override
  String get plugslotsNativeUi => 'UI nativa';

  @override
  String plugslotsIssueCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count problemas', one: '1 problema');
    return '$_temp0';
  }

  @override
  String get plugslotsAllGood => 'Não há problema.';

  @override
  String plugslotsViewSize(String size) {
    return 'Ver $size';
  }

  @override
  String plugslotsInvokeMs(int ms) {
    return '$ms ms';
  }

  @override
  String get plugslotsLastView => 'Última visão';

  @override
  String get plugslotsLastInvoke => 'Última resposta';

  @override
  String get plugslotsProblems => 'Problemas';

  @override
  String get plugslotsNoProblems => 'Não há problema.';

  @override
  String plugslotsWantsDraft(String plugin) {
    return '$plugin quer ler o seu rascunho';
  }

  @override
  String plugslotsWantsClipboard(String plugin) {
    return '$plugin quer ler a sua área de transferência';
  }

  @override
  String plugslotsWantsBoth(String plugin) {
    return '$plugin deseja ler o seu rascunho e área de transferência';
  }

  @override
  String get plugslotsWantsWhen => 'Só quando o tocas';

  @override
  String get plugslotsAllow => 'Permitir';

  @override
  String plugslotsNoResponse(String plugin) {
    return '$plugin não respondeu';
  }

  @override
  String plugslotsFailed(String plugin) {
    return '$plugin encontrou um problema';
  }

  @override
  String get plugslotsNeedsChat => 'Abrir uma conversa primeiro';

  @override
  String plugslotsFromPlugin(String plugin) {
    return 'De $plugin';
  }

  @override
  String get plugslotsPanelOffline => 'Não foi possível alcançar o plug-in';

  @override
  String plugslotsIssueTooMany(int max) {
    return 'Até $max; o resto está escondido';
  }

  @override
  String plugslotsIssueTrimmed(int max) {
    return 'Terminado $max caracteres; encurtado';
  }

  @override
  String plugslotsIssueNeedsApp(String version) {
    return 'Precisa de DSH Go $version ou mais tarde';
  }

  @override
  String get plugslotsIssueNewerProtocol => 'Precisa de uma aplicativo mais recente';

  @override
  String get plugslotsIssueUnknownIcon => 'Ícone desconhecido; usando o padrão';

  @override
  String plugslotsIssueUnknownEffect(String name) {
    return 'Efeito não suportado \"$name\"';
  }

  @override
  String get plugslotsIssueLate => 'Voltou mais de 3 s após a torneira; ignorado';

  @override
  String get plugslotsIssueHttps => 'Apenas ligações https';

  @override
  String plugslotsIssueUnknownPage(String page) {
    return 'Nenhuma página chamada \"$page\"';
  }

  @override
  String get plugslotsIssueThrottled => 'Avisos muito frequentes; ignorados';

  @override
  String plugslotsIssueInvoke(String message) {
    return 'A chamada falhou: $message';
  }

  @override
  String plugslotsIssueStream(String message) {
    return 'Os dados falharam: $message';
  }

  @override
  String get plugslotsIssueMissing => 'Falta um campo obrigatório';

  @override
  String get plugslotsIssueDuplicate => 'Duplicar o ID; ignorado';

  @override
  String get plugslotsIssueNoPlacement => 'Não há lugar para mostrar';

  @override
  String plugslotsWantsMessage(String plugin) {
    return '$plugin quer ler esta resposta';
  }

  @override
  String get plugslotsCodeInvalidManifest => 'A declaração é inválida; as partes nativas estão desligadas';

  @override
  String get plugslotsCodeInvalidField => 'Formato errado; ignorado';

  @override
  String get plugslotsCodeUnknownField => 'Campo desconhecido; ignorado';

  @override
  String get plugslotsCodeUnknownSurface => 'Ainda não suportado aqui; ignorado';

  @override
  String get plugslotsCodeTooMany => 'Demasiados; os extras estão escondidos';

  @override
  String get plugslotsCodeTooLong => 'Demasiado longo; encurtado';

  @override
  String get plugslotsCodeNoHandler => 'Ainda não manipulado pelo plugin; oculto';

  @override
  String get plugslotsCodeUndeclared => 'Registado, mas não declarado; ignorado';

  @override
  String get plugslotsCodeViewFile => 'Não foi possível ler o arquivo de visualização';

  @override
  String get plugslotsCodeBadEffect => 'Ação mal formada; ignorada';

  @override
  String plugslotsCodeViolation(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count vezes', one: 'uma vez');
    return 'Falha $_temp0';
  }

  @override
  String get plugslotsCodeDegraded => 'Demasiados erros; desligado até ao próximo início';

  @override
  String get plugslotsCodeTimeout => 'O plugin não respondeu a tempo';

  @override
  String get plugslotsCodeRateLimited => 'Toques muito rápidos';

  @override
  String get plugslotsCodeNotFound => 'O plug-in está desligado ou faltando';

  @override
  String get plugslotsCodePluginError => 'O plug-in falhou';

  @override
  String get plugslotsCodeInvalidView => 'A visão é inválida';

  @override
  String get plugslotsCodeLimit => 'Muitas assinaturas';

  @override
  String get plugslotsCodeOther => 'Outro problema';

  @override
  String get plugslotsCodeUnknownEffect => 'Ação não suportada; pulou';

  @override
  String get plugslotsNotDone => 'Não terminei.';

  @override
  String get plugslotsWorking => 'A trabalhar';

  @override
  String get plugslotsTapToCancel => 'Toque em para cancelar';

  @override
  String get plugslotsCodeTooManyPending => 'Dois ainda estão em execução';

  @override
  String get plugslotsCodeNoStream => 'A conexão caiu';

  @override
  String plugslotsVoiceAsk(String plugin) {
    return 'Vamos $plugin Estás a ouvir-me?';
  }

  @override
  String get plugslotsVoiceWhen =>
      'A leitura pára assim que falas. Sua voz está verificada neste celular, nunca salvo ou enviado';

  @override
  String get plugslotsVoiceDeny => 'Não permitas';

  @override
  String get plugslotsVoiceSwitch => 'Ouve-te falar';

  @override
  String get plugslotsPickerUnavailable => 'A seleção de arquivos não está disponível neste dispositivo';

  @override
  String get plugslotsPickerBusy => 'Terminar primeiro a selecção de arquivos actual';

  @override
  String plugslotsPickerLimit(int count) {
    return 'Até $count arquivos, 8 MiB cada e 16 MiB total';
  }

  @override
  String get plugslotsPickerFailed => 'Não foi possível compartilhar os arquivos com este plugin. Tente novamente.';

  @override
  String get plugslotsWebPlacesTitle => 'Na Web DSH';

  @override
  String get plugslotsPlaceBesideComposer => 'Ao lado do compositor';

  @override
  String get plugslotsPlaceHeader => 'Cabeçalho de conversação';

  @override
  String get plugslotsPlaceMessages => 'Nas mensagens';

  @override
  String get plugslotsPlaceOverlay => 'Camada flutuante';

  @override
  String get plugslotsPlaceSidebar => 'Barra lateral';

  @override
  String get plugslotsPlaceRightbar => 'Barra lateral direita';

  @override
  String get plugslotsPlaceFiles => 'Visualização de arquivos';

  @override
  String get plugslotsPlaceSettings => 'Configuração';

  @override
  String get plugslotsPlacePlugins => 'Página de plug-ins';

  @override
  String get plugslotsPlaceNewChat => 'Nova conversa';

  @override
  String get plugslotsPlaceElsewhere => 'Em outro lugar';

  @override
  String get plugslotsPlaceUnknown => 'Sua interface web';

  @override
  String get plugslotsChatEntry => 'Plugins';

  @override
  String plugslotsChatWebFrom(String names) {
    return 'Plug-ins da Web · $names';
  }

  @override
  String get plugViewInvalid => 'A visão do plug-in tem um erro';

  @override
  String get plugViewEmpty => 'Sem dados ainda';

  @override
  String get plugViewImageUnavailable => 'Não é possível exibir a imagem';

  @override
  String get plugViewUnavailableList => 'Não é possível exibir a lista';

  @override
  String get plugViewUnavailableKeyValue => 'Não é possível exibir detalhes';

  @override
  String get plugViewUnavailableProgress => 'Não é possível mostrar o progresso';

  @override
  String get plugViewUnavailableTable => 'Não é possível exibir a tabela';

  @override
  String get plugViewUnavailableActions => 'Não é possível exibir os botões';

  @override
  String plugViewFrom(String name) {
    return 'De $name';
  }

  @override
  String plugViewUnknownTone(String value) {
    return 'Tom desconhecido $value, ignorado; disponível: bom, alerta, mau, informação, mudo';
  }

  @override
  String plugViewBadActionId(String value) {
    return 'ID de ação inválido $value; este elemento não é tappable';
  }

  @override
  String plugViewBadAction(String shape) {
    return 'Uma ação deve ser um texto id ou $shape; ignorado';
  }

  @override
  String plugViewArgsLimit(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit bytes', one: '1 byte');
    return 'Args de ação exceder $_temp0; ignorado';
  }

  @override
  String plugViewUnknownIcon(String value) {
    return 'Ícone desconhecido $value; desenhado com o ícone padrão';
  }

  @override
  String plugViewExpectedItems(String shape) {
    return 'Esperava- se uma série de $shape';
  }

  @override
  String plugViewSkippedItem(String shape) {
    return 'Esperado $shape; item ignorado';
  }

  @override
  String get plugViewBadMax => 'max deve ser um número acima de 0; usando 100';

  @override
  String plugViewColumnLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first colunas', one: '1 coluna');
    return '$_temp0, excedendo o limite de $second';
  }

  @override
  String plugViewFirstColumns(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit colunas', one: '1 coluna');
    return 'Mostrando apenas o primeiro $_temp0';
  }

  @override
  String plugViewFirstRows(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit linhas', one: '1 linha');
    return 'Mostrando apenas o primeiro $_temp0';
  }

  @override
  String get plugViewOnePrimary => 'Uma visão tem no máximo um botão primário; este é desenhado como plano';

  @override
  String get plugViewBadImageSource =>
      'As imagens pegam um ativo de plugin (asset:<path>, png, jpg, webp ou gif) ou um dado:image/... URL';

  @override
  String get plugViewBadAspect => 'aspecto deve ser um número de 0,25 a 4; ignorado';

  @override
  String plugViewImageTooLarge(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit bytes', one: '1 byte');
    return 'dados: a imagem excede $_temp0';
  }

  @override
  String get plugViewImageDecode => 'A imagem não pode ser decodificada (PNG, JPEG, WebP ou GIF apenas)';

  @override
  String get plugViewImagePixels => 'Imagem excede o limite de tamanho: 4096 por lado, 4 milhões de pixels no total';

  @override
  String plugViewTooDeep(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit níveis', one: '1 nível');
    return 'JSON aninhado mais profundo do que $_temp0';
  }

  @override
  String get plugViewV2Content => 'Conteúdo do plug-in';

  @override
  String plugViewVersionFallback(String version) {
    return 'Ver versão $version não é suportado; usando a visão compatível';
  }

  @override
  String plugViewStyleInvalid(String values) {
    return 'Estilo inválido; esperado $values';
  }

  @override
  String get plugViewStyleReserved => 'Esta aparência é reservada para o aplicativo; ignorado';

  @override
  String get plugViewStyleContainerOnly => 'Este estilo só está disponível na pilha e linha';

  @override
  String get plugViewStyleTextOnly => 'Este estilo só está disponível em texto, métrica e chamada';

  @override
  String plugViewContrastAdjusted(String mode, String before, String after, String minimum) {
    return '$mode: $before ajustados para $after, contraste pelo menos $minimum:1';
  }

  @override
  String get plugViewRichLimit => 'Texto rico excede o limite; truncado';

  @override
  String plugViewBadTrend(int max) {
    return 'tendência leva 2–$max números (nulls permitidos); ignorados';
  }

  @override
  String plugViewGalleryPicture(int index) {
    return 'Imagem $index';
  }

  @override
  String get readListUpdating => 'Atualização · resultados anteriores';

  @override
  String get readListOffline => 'Desligado · resultados anteriores';

  @override
  String get readListFailed => 'Não atualizado · resultados anteriores';

  @override
  String get remoteStartupSection => 'No lançamento';

  @override
  String get remoteAutoConnectOnStartup => 'Ligar à última máquina';

  @override
  String get remoteAutoConnectOnStartupHint => 'Quando desligado, comece neste celular';

  @override
  String get remoteStepConnect => 'Ligar ao servidor';

  @override
  String get remoteStepVerifyHostKey => 'Verificar a impressão digital da máquina';

  @override
  String get remoteStepStartDsh => 'Iniciar o DSH';

  @override
  String get remoteStepTunnel => 'Criar um túnel';

  @override
  String get remoteConnecting => 'Conectando';

  @override
  String get remoteConnected => 'Ligado';

  @override
  String get remoteReconnecting => 'Reconectando';

  @override
  String remoteReconnectAttempt(int count) {
    return 'Reconectando · Tentativa $count';
  }

  @override
  String get remoteErrInvalidServer => 'Endereço do servidor inválido';

  @override
  String get remoteErrEmailPassword => 'E- mail ou senha incorretos';

  @override
  String get remoteErrHostNotInAccount => 'Este host não está em sua conta';

  @override
  String get remoteHostFallback => 'Esta máquina';

  @override
  String get remoteErrHostOffline => 'A máquina está offline';

  @override
  String remoteErrHostRemoved(String name) {
    return '$name não está mais na sua conta DSH Remote';
  }

  @override
  String get remoteErrRelaySignInExpired => 'O login remoto do DSH expirou';

  @override
  String get remoteErrIdentityKeyChanged => 'A chave de identidade da máquina mudou';

  @override
  String get remoteErrIdentityUnconfirmed => 'A impressão digital da identidade do hospedeiro não foi confirmada';

  @override
  String get remoteErrConnectionReplaced => 'A ligação remota foi substituída';

  @override
  String get remoteErrHostRejected => 'A máquina recusou a ligação';

  @override
  String get remoteErrHostNotOwned => 'Host não está em sua conta DSH Remote';

  @override
  String get remoteErrUpdateNeeded => 'Desvio de versão. Atualizar o DSH Go e plugin remoto da máquina';

  @override
  String get remoteErrVersionIncompatible => 'Atualizar o DSH ou o plug-in remoto na máquina';

  @override
  String get remoteErrSignInTimeout => 'Data-limite de entrada';

  @override
  String get remoteSignInCancelled => 'Inscrição cancelada';

  @override
  String get remoteErrBrowserSignInUnsupported => 'O servidor não suporta o login do navegador';

  @override
  String get remoteErrTooManyRequests => 'Muitos pedidos';

  @override
  String get remoteErrHostUnreachable => 'Não é possível alcançar o host remoto';

  @override
  String get remoteErrRemoteConnection => 'Não foi possível conectar remotamente';

  @override
  String get remoteOnline => 'Online';

  @override
  String get remoteOffline => 'Desligado';

  @override
  String get remoteUnavailable => 'Indisponível';

  @override
  String get remoteErrHostNotFound => 'Máquina não encontrada';

  @override
  String get remoteConnectionStopped => 'Ligação remota parada';

  @override
  String remoteBootstrapReusePort(int port) {
    return 'Usando o DSH em execução (porta $port)';
  }

  @override
  String get remoteBootstrapStarting => 'Iniciando DSH remoto...';

  @override
  String remoteErrCommandNotFound(String command) {
    return '“$command” não encontrado no hospedeiro';
  }

  @override
  String get remoteErrDshMissing =>
      'dsh não está instalado no host. Instale- o e tente novamente, ou digite seu caminho completo como o comando start.';

  @override
  String get remoteStartCommandExample => 'Comando de início de exemplo: ~/.nvm/versions/node/v22.0.0/bin/dsh web';

  @override
  String get remoteErrDshStartTimeout => 'DSH remoto demorou muito para iniciar';

  @override
  String get remoteErrDshExited => 'O DSH remoto terminou logo após o início';

  @override
  String get remoteErrDshStart => 'Não foi possível iniciar o DSH remoto';

  @override
  String remoteExitCode(int code) {
    return 'Código de saída $code';
  }

  @override
  String get remoteErrNoShell => 'O servidor não tem sh. Apenas Linux e macOS são compatíveis.';

  @override
  String get remoteErrFingerprintChanged => 'A impressão digital do hospedeiro mudou. Desligado.';

  @override
  String get remoteErrFingerprintUnconfirmed => 'A impressão digital do hospedeiro não foi confirmada';

  @override
  String get remoteHostTrustCancelled => 'Confiança da máquina cancelada';

  @override
  String get remoteCheckingDsh => 'A verificar o DSH remoto...';

  @override
  String get remoteErrDshPort => 'Não é possível alcançar a porta DSH remota';

  @override
  String get remoteDshReused => 'Usando o DSH já em execução na máquina';

  @override
  String get remoteDshStarted => 'Inicia o DSH na máquina';

  @override
  String get remoteErrDshTokenRejected => 'DSH remoto rejeitou o token de entrada';

  @override
  String get remoteErrDshSignIn => 'Não foi possível iniciar sessão no DSH remoto';

  @override
  String get remoteErrDshTunnel => 'Não foi possível conectar ao DSH através do túnel';

  @override
  String get remoteErrDshSignInExpired => 'O registo remoto do DSH expirou';

  @override
  String get remoteErrDshStopped => 'DSH remoto parou de correr';

  @override
  String get remoteErrSshDisconnected => 'SSH desconectado';

  @override
  String get remoteErrSshUnresponsive => 'SSH não está respondendo';

  @override
  String remoteRetryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Repetido $count vezes',
      one: 'Já tentei uma vez.',
    );
    return '$_temp0';
  }

  @override
  String get remoteErrSshNetworkChanged => 'SSH desconectado após uma mudança de rede';

  @override
  String get remoteErrReadFingerprint => 'Não foi possível ler a impressão digital da máquina';

  @override
  String get remoteErrNoFingerprint => 'O servidor não forneceu uma impressão digital da máquina';

  @override
  String get remoteErrPasswordMissing => 'Digite uma senha';

  @override
  String remoteErrAddressUnresponsive(String host, int port) {
    return '$host:$port não responde';
  }

  @override
  String get remoteErrPrivateKeyMissing => 'Digite uma chave privada';

  @override
  String get remoteErrKeyNeedsPassword => 'Esta chave privada precisa de uma frase- senha';

  @override
  String get remoteErrKeyPassword => 'Senha da chave privada incorreta';

  @override
  String get remoteErrKeyUnreadable => 'Não foi possível ler a chave privada';

  @override
  String remotePrivateKeyFormats(String error) {
    return 'Aceita chaves privadas Ed25519, RSA e ECDSA nos formatos OpenSSH e PEM.\n$error';
  }

  @override
  String remoteErrAddressRejected(String address) {
    return '$address recusou a ligação';
  }

  @override
  String remoteErrSshHostNotFound(String host) {
    return 'Máquina $host não encontrado';
  }

  @override
  String remoteErrSshAddressUnresponsive(String address) {
    return '$address não responde';
  }

  @override
  String get remoteErrUsernamePassword => 'Nome de usuário ou senha incorretos';

  @override
  String get remoteErrPrivateKeyRejected => 'O servidor não aceita esta chave privada';

  @override
  String remoteAuthorizedKeysHelp(String username, String error) {
    return 'Verifique se a chave pública está em ~/.ssh/authorized_keys para o usuário $username.\n$error';
  }

  @override
  String get remoteErrFingerprintUntrusted => 'A impressão digital do host não é confiável';

  @override
  String get remoteErrSshHandshakeTimeout => 'Aperto de mão SSH cronometrado';

  @override
  String get remoteErrSshInterrupted => 'Ligação SSH interrompida';

  @override
  String get remoteErrSshConnection => 'Não foi possível conectar sobre SSH';

  @override
  String get remoteErrCommandTimeout => 'Tempo- limite do comando remoto';

  @override
  String get remoteHostedErrNetwork =>
      'Não é possível chegar ao serviço de compartilhamento. Verifique sua conexão e tente novamente.';

  @override
  String get remoteHostedErrTooLarge => 'O chat é demasiado grande para criar um link';

  @override
  String get remoteHostedErrRateLimited => 'Compartilhar com demasiada frequência. Tente novamente mais tarde.';

  @override
  String get remoteHostedErrCreate => 'Não foi possível criar o link';

  @override
  String get remoteHostedErrUnavailable =>
      'O serviço de compartilhamento não está disponível. Tente novamente mais tarde.';

  @override
  String get remoteHostedErrGone => 'A ligação expirou ou foi suprimida';

  @override
  String get remoteHostedErrForbidden => 'Você não tem permissão para excluir este link';

  @override
  String get remoteHostedErrBroken => 'A ligação está incompleta ou danificada';

  @override
  String get remoteChat => 'Conversar';

  @override
  String get remoteHostedTtlWeek => '7 dias';

  @override
  String get remoteHostedTtlMonth => '30 dias';

  @override
  String get remoteHostedTtlForever => 'Para sempre.';

  @override
  String get remoteForumSignIn => 'Iniciar sessão no Fórum';

  @override
  String get remoteForumSignInBenefits => 'Postar, responder e gostar';

  @override
  String get remoteForumFinishSignIn => 'Terminar de iniciar sessão no seu navegador';

  @override
  String get remoteReopenBrowser => 'Abrir de novo o navegador';

  @override
  String get remoteForumSettings => 'Configuração do fórum';

  @override
  String get remoteForumAccount => 'Conta do fórum';

  @override
  String get remoteForumTopic => 'Tópico';

  @override
  String get remoteForumLikesReceived => 'Likes recebidos';

  @override
  String get remoteForumDaysVisited => 'Dias visitados';

  @override
  String get remoteForumNotifications => 'Notificação';

  @override
  String remoteForumUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count não lido', one: '1 não lido');
    return '$_temp0';
  }

  @override
  String get remoteForumErrAddress => 'Endereço inválido';

  @override
  String get remoteForumAddress => 'Endereço do fórum';

  @override
  String remoteForumDefaultAddress(String host) {
    return 'Predefinição: $host';
  }

  @override
  String get remoteRestoreDefault => 'Restaurar padrão';

  @override
  String get remoteForumUploadingImage => 'Enviando imagem...';

  @override
  String get remoteForumErrUploadImage => 'Não foi possível enviar a imagem';

  @override
  String get remoteForumTitleRequired => 'Adicionar um título primeiro';

  @override
  String get remoteForumCategoryRequired => 'Escolha uma categoria';

  @override
  String get remoteForumBodyRequired => 'Escreva algo antes de enviar';

  @override
  String remoteForumReplyCaption(String username, String title) {
    return 'Responder para @$username · $title';
  }

  @override
  String get remoteForumNewTopic => 'Novo tópico';

  @override
  String get remoteForumTitle => 'Título';

  @override
  String get remoteForumComposerHint => 'Escreve qualquer coisa. A marcação foi suportada.';

  @override
  String get remoteForumPublish => 'Publicar';

  @override
  String get remoteForumImage => 'Imagem';

  @override
  String get remoteForumAttachShareCode => 'Anexar código de compartilhamento';

  @override
  String get remoteForumPendingApproval => 'Apresentado. Visível após aprovação.';

  @override
  String get remoteForumLatest => 'Última';

  @override
  String get remoteForumTop => 'Topo';

  @override
  String get remoteForumErrOpen => 'Não foi possível abrir o Fórum';

  @override
  String get remoteForumNoTopics => 'Sem tópicos ainda';

  @override
  String get remoteForumPost => 'Publicação';

  @override
  String get remoteForum => 'Fórum';

  @override
  String remoteForumNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Notificações $count não lido',
      one: 'Notificações, 1 não lidas',
    );
    return '$_temp0';
  }

  @override
  String get remoteForumSearch => 'Procurar';

  @override
  String get remoteForumSearchHint => 'Pesquisar tópicos e posts';

  @override
  String get remoteForumSignedIn => 'Assinado no Fórum';

  @override
  String get remoteForumSignInForNotifications => 'Iniciar sessão para ver as notificações';

  @override
  String get remoteForumErrNotifications => 'Não foi possível carregar notificações';

  @override
  String get remoteForumNoNotifications => 'Sem notificações ainda';

  @override
  String get remoteForumMarkAllRead => 'Marcar todas as leituras';

  @override
  String get remoteForumSomeone => 'Alguém.';

  @override
  String remoteForumNotificationMention(String who) {
    return '$who mencionou você';
  }

  @override
  String remoteForumNotificationGroupMention(String who) {
    return '$who mencionou o seu grupo';
  }

  @override
  String remoteForumNotificationReply(String who) {
    return '$who respondeu-lhe';
  }

  @override
  String remoteForumNotificationQuote(String who) {
    return '$who citou você';
  }

  @override
  String remoteForumNotificationEdit(String who) {
    return '$who editou o seu post';
  }

  @override
  String remoteForumNotificationLikes(String who, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$who e outros ($count pessoas) gostou do seu post',
      one: '$who gostou do seu post',
    );
    return '$_temp0';
  }

  @override
  String remoteForumNotificationLike(String who) {
    return '$who gostou do seu post';
  }

  @override
  String remoteForumNotificationLikedPosts(String who, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$who gostou $count de seus postos',
      one: '$who gostou de 1 de seus posts',
    );
    return '$_temp0';
  }

  @override
  String remoteForumNotificationReaction(String who) {
    return '$who reagiu ao seu post';
  }

  @override
  String remoteForumNotificationMessage(String who) {
    return '$who enviou- lhe uma mensagem privada';
  }

  @override
  String remoteForumNotificationMessageInvite(String who) {
    return '$who convidou-o para uma mensagem privada';
  }

  @override
  String remoteForumNotificationTopicInvite(String who) {
    return '$who convidou você para um tópico';
  }

  @override
  String remoteForumNotificationNewReply(String who) {
    return '$who postou uma nova resposta';
  }

  @override
  String remoteForumNotificationNewTopic(String who) {
    return '$who postou um novo tópico';
  }

  @override
  String remoteForumNotificationLink(String who) {
    return '$who ligado ao seu post';
  }

  @override
  String remoteForumNotificationBadge(String badge) {
    return 'Ganhado o “$badge” crachá';
  }

  @override
  String remoteForumNotificationMoved(String who) {
    return '$who moveu seu post';
  }

  @override
  String get remoteForumBookmarkReminder => 'Lembrete do favorito';

  @override
  String get remoteForumTopicReminder => 'Atenção ao tópico';

  @override
  String get remoteForumPostApproved => 'Seu post foi aprovado';

  @override
  String get remoteForumAdminProblems => 'Fórum tem questões a resolver';

  @override
  String get remoteForumNewNotification => 'Nova notificação';

  @override
  String get remoteForumUnread => 'Não- Lido';

  @override
  String get remoteForumErrShareCode => 'Não foi possível abrir o código de compartilhamento';

  @override
  String get remoteForumPoll => 'Pesquisa';

  @override
  String get remoteForumVideo => 'Vídeo';

  @override
  String get remoteForumEmbed => 'Conteúdo incorporado';

  @override
  String get remoteForumVoteOnWeb => 'Vote na Web';

  @override
  String get remoteForumErrSearch => 'Não foi possível pesquisar';

  @override
  String remoteForumNoSearchResults(String term) {
    return 'Não existem resultados para “$term”';
  }

  @override
  String get remoteForumBookmarkRemoved => 'Marcador removido';

  @override
  String get remoteForumBookmarkAdded => 'Favoritos';

  @override
  String get remoteLinkCopied => 'Ligação copiada';

  @override
  String get remoteForumErrTopic => 'Não foi possível abrir este tópico';

  @override
  String get remoteForumTopicClosed => 'O tópico está encerrado';

  @override
  String get remoteForumReplyHint => 'Escreva uma resposta...';

  @override
  String get remoteForumSignInToReply => 'Entrar para responder';

  @override
  String remoteForumReplyTo(String username) {
    return 'Responder para @$username';
  }

  @override
  String get remoteForumPostDeleted => 'Publicação apagada';

  @override
  String get remoteForumPostHidden => 'Publicação escondida';

  @override
  String get remoteForumUnlike => 'Diferente';

  @override
  String get remoteForumLike => 'Como';

  @override
  String get remoteForumRemoveBookmark => 'Remover marcador';

  @override
  String get remoteForumBookmark => 'Favoritos';

  @override
  String get remoteForumActionPinned => 'Preencher o tópico';

  @override
  String get remoteForumActionUnpinned => 'Desmarcar o tópico';

  @override
  String get remoteForumActionClosed => 'Fechado o tópico';

  @override
  String get remoteForumActionReopened => 'Reabriu o tópico';

  @override
  String get remoteForumActionAutoClosed => 'Assunto fechado automaticamente';

  @override
  String get remoteForumActionAutoOpened => 'Tópico aberto automaticamente';

  @override
  String get remoteForumActionArchived => 'Arquivado o tópico';

  @override
  String get remoteForumActionUnarchived => 'Desarquivado o tópico';

  @override
  String get remoteForumActionListed => 'Tornou o tópico público';

  @override
  String get remoteForumActionUnlisted => 'Não listado o tópico';

  @override
  String get remoteForumActionSplit => 'Dividir o tópico';

  @override
  String get remoteForumActionBanner => 'Fez do tópico um banner';

  @override
  String get remoteForumActionRemoveBanner => 'Remover o banner';

  @override
  String get remoteForumActionUpdated => 'Atualizado o tópico';

  @override
  String get remoteLoading => 'Carregando';

  @override
  String get remoteForumJustNow => 'Agora mesmo.';

  @override
  String remoteForumMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min atrás', one: '1 min atrás');
    return '$_temp0';
  }

  @override
  String remoteForumHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count h atrás', one: '1 h atrás');
    return '$_temp0';
  }

  @override
  String remoteForumDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count dias atrás', one: '1 dia atrás');
    return '$_temp0';
  }

  @override
  String remoteForumReplyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count respostas', one: '1 resposta');
    return '$_temp0';
  }

  @override
  String remoteForumNewReplyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count novas respostas',
      one: '1 nova resposta',
    );
    return '$_temp0';
  }

  @override
  String get remoteForumNew => 'Novo';

  @override
  String remoteForumErrorRetry(String error) {
    return '$error · Tentar novamente';
  }

  @override
  String get remoteForumNoMore => 'Não mais.';

  @override
  String get remoteHostKeyTrustTitle => 'Confiar neste servidor?';

  @override
  String remoteHostKeyFirstConnection(String name, String address) {
    return 'Primeira conexão com “$name” ($address). Confira a impressão digital para confirmar que é o servidor correto.';
  }

  @override
  String get remoteHostKeyTrustConnect => 'Confiar e conectar';

  @override
  String get remoteHostKeyChangedTitle => 'A impressão digital da identidade foi alterada';

  @override
  String remoteRelayKeyChangedBody(String name) {
    return 'A chave de identidade para “$name” mudou. Continue apenas se você reinstalou o plugin remoto neste host. Alguém pode estar a fazer-se passar por ele.';
  }

  @override
  String remoteRelayKeyFirstBody(String name) {
    return 'Primeira ligação a “$name“. Verifique se a impressão digital de identidade corresponde à mostrada pelo plugin remoto da máquina antes de continuar.';
  }

  @override
  String get remoteHostKeyChangeWarning => 'O DSH recusará a ligação se a impressão digital mudar.';

  @override
  String get remoteHostKeyTrustAgain => 'Confia outra vez.';

  @override
  String get remoteHostKeyReading => 'A ler a impressão digital da máquina...';

  @override
  String remoteHostSwitcherSemantics(String name, String status) {
    return 'Máquina atual: $name, $status. Mudar de máquina';
  }

  @override
  String get remoteSwitchHost => 'Mudar de máquina';

  @override
  String get remoteThisPhoneDsh => 'DSH neste celular';

  @override
  String get remoteRemoteLabel => 'Remoto';

  @override
  String remoteRemotePlatform(String platform) {
    return 'Remoto · $platform';
  }

  @override
  String get remoteRelaySwitchWarning =>
      'DSH Remote se conecta a uma máquina de cada vez. A mudança desliga a máquina anterior.';

  @override
  String get remoteConnectComputer => 'Ligar um computador ou servidor';

  @override
  String get remoteManageHosts => 'Gerenciar máquinas remotas';

  @override
  String get remoteConnectionMethods => 'Via SSH ou DSH Remote';

  @override
  String get remoteRelayLoginRequired => 'Digite o endereço do servidor, e- mail e senha';

  @override
  String get remoteErrSignIn => 'Não foi possível iniciar sessão';

  @override
  String get remoteSelfHostedServer => 'Servidor auto- hospedado';

  @override
  String get remoteSelfHostedSignInHelp => 'Entre em seu próprio liguobao/ds-harness-remote com e-mail e senha';

  @override
  String get remoteServerAddress => 'Endereço do servidor';

  @override
  String get remoteEmail => 'E- mail';

  @override
  String get remotePassword => 'Senha';

  @override
  String get remoteRestoreServer => 'Restaurar o servidor padrão dsh.r2049.cn';

  @override
  String get remoteConsole => 'Consola remota';

  @override
  String get remoteHostsIntro => 'Continue usando DSH de seu computador ou servidor em seu telefone';

  @override
  String get remoteSshHosts => 'Servidores SSH';

  @override
  String get remoteSshRequirements => 'Necessidades da máquina ativadas SSH e instaladas DSH';

  @override
  String get remoteAddSshHost => 'Adicionar máquina SSH';

  @override
  String get remoteSshDirect => 'Nenhum servidor de terceiros';

  @override
  String get remoteOtherMethods => 'Outros métodos';

  @override
  String get remoteWebConsole => 'Consola remota da Web';

  @override
  String get remoteWebConsoleProvider => 'dsh.r2049.cn · Página de terceiros';

  @override
  String remoteActiveHost(String name) {
    return 'Utilizar “$name”';
  }

  @override
  String get remoteSwitchToPhone => 'Usar este celular';

  @override
  String get remoteSignInAgain => 'Assinar novamente';

  @override
  String get remoteHostSettings => 'Configuração da máquina';

  @override
  String get remoteReconnect => 'Religar';

  @override
  String get remoteReconnectingEllipsis => 'Reconectando...';

  @override
  String remoteReconnectReason(String reason) {
    return 'Reconectando · $reason';
  }

  @override
  String get remoteConnectedEncrypted => 'Conectado · Criptografado de ponta a ponta';

  @override
  String remoteConnectedSsh(String address) {
    return 'Conectado · SSH $address';
  }

  @override
  String get remoteErrRefreshHosts => 'Não foi possível atualizar a lista de máquinas';

  @override
  String get remoteSwitchWarning => 'Liga- se a uma máquina de cada vez. A mudança desliga a máquina anterior.';

  @override
  String get remoteRefreshHosts => 'Atualizar máquinas';

  @override
  String get remoteSignOut => 'Sair';

  @override
  String get remoteErrHostsRetry => 'Não foi possível carregar hosts · Toque para tentar novamente';

  @override
  String get remoteNoHosts => 'Sem máquinas ainda';

  @override
  String get remoteRelaySetupHelp => 'Instale o plug-in remoto no DSH da máquina e faça login';

  @override
  String get remoteRelaySignOutTitle => 'Sair do DSH Remote?';

  @override
  String get remoteRelaySignOutBody =>
      'Este celular será removido da sua conta. O DSH e as conversas no servidor permanecerão. Você pode entrar novamente quando quiser.';

  @override
  String get remoteRelaySignInTitle => 'Iniciar sessão no DSH Remote';

  @override
  String get remoteRelaySignInHelp => 'Sem configuração de rede. Ligação criptografada de ponta a ponta.';

  @override
  String get remoteBrowserSignIn => 'Iniciar sessão no navegador';

  @override
  String remoteSignInWithProvider(String provider) {
    return 'Continuar com $provider';
  }

  @override
  String get remoteComingSoon => 'Em breve.';

  @override
  String get remoteSelfHostedEmailSignIn => 'Servidor auto- hospedado · Entrada por e-mail';

  @override
  String get remoteBrowserSignInPending => 'Terminar de iniciar sessão no seu navegador...';

  @override
  String get remoteCopySignInLink => 'Copiar a ligação de entrada';

  @override
  String get remoteSshAddressRequired => 'Digite um endereço da máquina (IP ou domínio)';

  @override
  String get remoteSshUsernameRequired => 'Digite um nome de usuário';

  @override
  String get remoteSshPasswordRequired => 'Digite uma senha SSH ou use uma chave privada';

  @override
  String get remoteSshKeyRequired => 'Cole a chave privada completa (começando com -----BEGIN)';

  @override
  String get remoteHostKeyResetTitle => 'Repor a impressão digital da máquina?';

  @override
  String get remoteHostKeyResetBody =>
      'Só o faça se a máquina foi reinstalada ou substituída. Você será solicitado a verificar a impressão digital da próxima vez que você conectar.';

  @override
  String get remoteReset => 'Reiniciar';

  @override
  String remoteDeleteHostTitle(String name) {
    return 'Apagar “$name”?';
  }

  @override
  String get remoteDeleteHostBody =>
      'As configurações deste servidor e a senha e chave privada salvas neste celular serão excluídas. O DSH e as conversas no servidor permanecerão.';

  @override
  String remoteErrReadKey(String error) {
    return 'Não foi possível ler: $error';
  }

  @override
  String get remoteErrPublicKeyFile =>
      'Este arquivo não contém uma chave privada. Escolha o arquivo sem `.pub` (por exemplo, `id_ed25519`).';

  @override
  String get remotePrivateKeyImported => 'Chave privada importada. Você pode excluir o arquivo original.';

  @override
  String get remoteEditHost => 'Editar máquina';

  @override
  String get remoteSshHostIntro => 'Conecte-se ao DSH em seu computador ou servidor';

  @override
  String get remoteHostBasicInfo => 'Informações de base';

  @override
  String get remoteHostNameHint => 'Por exemplo: medicine, medicine';

  @override
  String get remoteHost => 'Máquina';

  @override
  String get remoteHostAddressHint => '192.168.1.20 ou exemplo.com';

  @override
  String get remoteUsername => 'Usuário';

  @override
  String get remotePort => 'Porto';

  @override
  String get remoteAuthentication => 'Método de registo';

  @override
  String get remotePasswordStorageHelp => 'Salvo apenas neste celular, criptografado pelo Android Keystore';

  @override
  String get remoteKeyStorageHelp =>
      'Salvo apenas neste celular, criptografado pelo Android Keystore. Apoia Ed25519, RSA e ECDSA.';

  @override
  String get remotePrivateKey => 'Chave privada';

  @override
  String get remoteShow => 'Mostrar';

  @override
  String get remoteImportKeyFile => 'Importar do arquivo';

  @override
  String get remotePrivateKeyPassword => 'Senha da chave privada (opcional)';

  @override
  String get remoteStartCommand => 'Iniciar comando';

  @override
  String get remoteStartCommandHelp => 'Se instalado com nvm, você pode inserir o caminho completo';

  @override
  String get remoteWorkingDirectory => 'Diretório de trabalho (opcional)';

  @override
  String get remoteWorkingDirectoryHelp => 'Pasta padrão para novas conversas. Suporta ~ /.';

  @override
  String get remoteHostFingerprint => 'Impressão digital da máquina';

  @override
  String get remoteHostKeyNotConfirmed => 'Ainda não confirmado';

  @override
  String get remoteHostKeyFirstCheck => 'Você será solicitado para verificar a impressão digital na primeira conexão';

  @override
  String get remoteDeleteHost => 'Apagar esta máquina';

  @override
  String get remoteTesting => 'Teste';

  @override
  String get remoteTestConnection => 'Ensaio';

  @override
  String get remoteHostedUpdateRequired => 'Atualizar o DSH para abrir este link';

  @override
  String get remoteHostedCannotOpen => 'Não é possível abrir este link';

  @override
  String get remoteOpening => 'A abrir...';

  @override
  String get remoteHostedNeverExpires => 'Nunca expira';

  @override
  String get remoteHostedExpired => 'Expirado';

  @override
  String get remoteHostedExpiresToday => 'Expira hoje';

  @override
  String get remoteHostedExpiresTomorrow => 'Termina amanhã';

  @override
  String remoteHostedExpiresOn(String date) {
    return 'Termo $date';
  }

  @override
  String get remoteHostedDeleteTitle => 'Apagar esta ligação?';

  @override
  String remoteHostedDeleteBody(String title) {
    return 'O link para “$title” deixará de trabalhar imediatamente';
  }

  @override
  String get remoteHostedLinkDeleted => 'Ligação apagada';

  @override
  String get remoteUndo => 'Desfazer';

  @override
  String get remoteHostedMyLinks => 'Meus links compartilhados';

  @override
  String get remoteHostedNoLinks => 'Sem links compartilhados ainda';

  @override
  String get remoteHostedErrDeleteNetwork => 'Não foi possível excluir. Verifique sua conexão e tente novamente.';

  @override
  String get remoteHostedErrDelete => 'Não foi possível excluir. Tente novamente mais tarde.';

  @override
  String get remoteDirectoryPickerTitle => 'Escolher pasta';

  @override
  String get remoteDirectoryChoose => 'Escolher';

  @override
  String get remoteDirectoryDefault => 'Pasta de trabalho padrão';

  @override
  String get remoteDirectoryHome => 'Principal';

  @override
  String get remoteDirectoryPhoneStorage => 'Armazenagem de telefone';

  @override
  String get remoteDirectoryDownloads => 'Transferências';

  @override
  String get remoteDirectoryDownloadsPath => 'Armazenamento/Download do telefone';

  @override
  String get remoteDirectoryDocuments => 'Documentos';

  @override
  String get remoteDirectoryDocumentsPath => 'Armazenagem/Documentos por telefone';

  @override
  String get remoteDirectoryLocations => 'Locais';

  @override
  String get remoteDirectoryRecent => 'Recente';

  @override
  String get remoteDirectoryEnterPath => 'Digite o caminho';

  @override
  String get remoteDirectoryGo => 'Vai.';

  @override
  String get remoteDirectoryAbsolutePath => 'Digite o caminho completo, começando com “/”';

  @override
  String get remoteDirectoryNewFolder => 'Nova pasta';

  @override
  String remoteDirectoryParentCaption(String name) {
    return 'Em “$name”';
  }

  @override
  String get remoteDirectoryFolderName => 'Nome da pasta';

  @override
  String get remoteDirectoryRoot => 'Raiz';

  @override
  String get remoteDirectoryErrCreate => 'Não foi possível criar a pasta';

  @override
  String get remoteDirectoryNoSubfolders => 'Sem subpastas aqui';

  @override
  String get remoteDirectoryHideHidden => 'Esconder pastas ocultas';

  @override
  String remoteDirectoryShowHidden(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mostrar $count pastas ocultas',
      one: 'Mostrar 1 pasta escondida',
    );
    return '$_temp0';
  }

  @override
  String get remoteDirectoryTruncated => 'Muitas pastas. Apenas os primeiros estão listados.';

  @override
  String get remoteWorkspaceAdd => 'Adicionar espaço de trabalho';

  @override
  String remoteWorkspaceAdded(String name) {
    return 'Adicionado “$name”';
  }

  @override
  String get remoteWorkspaceErrAdd => 'Não foi possível adicionar espaço de trabalho';

  @override
  String get remoteWorkspaceNoChats => 'Sem conversas';

  @override
  String remoteWorkspaceChatCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count chats', one: '1 chat');
    return '$_temp0';
  }

  @override
  String get remoteWorkspaceErrRename => 'Não foi possível renomear';

  @override
  String remoteWorkspaceRemoved(String name) {
    return 'Removido “$name”';
  }

  @override
  String get remoteWorkspaceErrRemove => 'Não foi possível remover o espaço de trabalho';

  @override
  String get remoteWorkspaceRename => 'Renomear espaço de trabalho';

  @override
  String get remoteWorkspaceName => 'Nome do espaço de trabalho';

  @override
  String get remoteWorkspaceNameRequired => 'Dá-lhe um nome.';

  @override
  String remoteWorkspaceRemoveTitle(String name) {
    return 'Remover “$name”?';
  }

  @override
  String get remoteWorkspaceRemoveBody => 'A pasta e as conversas ficam';

  @override
  String get remoteWorkspaceRemove => 'Remover';

  @override
  String get remoteWorkspace => 'Espaço de trabalho';

  @override
  String get remoteWorkspaceNewChatHere => 'Nova conversa aqui';

  @override
  String get remoteWorkspaceUnpin => 'Unpin';

  @override
  String get remoteWorkspaceGroup => 'Grupo';

  @override
  String get remoteWorkspaceUngrouped => 'Não agrupado';

  @override
  String get remoteWorkspaceRemoveAction => 'Remover espaço de trabalho';

  @override
  String get remoteWorkspaceNewGroup => 'Novo grupo';

  @override
  String get remoteWorkspaceGroupName => 'Nome do grupo';

  @override
  String remoteDirectoryPhonePath(String path) {
    return 'Armazenagem do telefone/$path';
  }

  @override
  String get remoteDirectoryInvalidName => 'O nome não pode conter “/”';

  @override
  String get remoteWorkspaceErrNameConflict => 'Já existe uma área de trabalho com este nome';

  @override
  String get remoteWorkspaceErrInvalidPath => 'Esta pasta não pode ser usada como espaço de trabalho';

  @override
  String get remoteWorkspaceErrNotFound => 'Este espaço de trabalho já não existe';

  @override
  String get remoteDirectoryErrUnreadable => 'Não foi possível abrir esta pasta';

  @override
  String get remoteDirectoryErrExists => 'Já existe uma pasta com este nome';

  @override
  String get remoteDirectoryErrUnavailable => 'Esta máquina não pode procurar pastas aqui';

  @override
  String get remoteWorkspaceErrUnsupported => 'Este host não suporta esta ação';

  @override
  String get remoteWorkspaceAllChats => 'Todas as conversas';

  @override
  String remoteWorkspaceSwitcherSemantics(String name) {
    return 'Espaço de trabalho: $name. Mudar de espaço de trabalho';
  }

  @override
  String get remoteWorkspaceManage => 'Gerenciar espaços de trabalho';

  @override
  String get remoteWorkspaceErrLoad => 'Não foi possível carregar espaços de trabalho';

  @override
  String get remoteWorkspaceEmpty => 'Sem espaços de trabalho ainda';

  @override
  String get remoteWorkspaceEmptyHint => 'Adicionar as pastas que você mais usa';

  @override
  String remoteWorkspaceCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count espaços de trabalho',
      one: '1 espaço de trabalho',
    );
    return '$_temp0';
  }

  @override
  String remoteDirectoryConfirmFolder(String action, String name) {
    return '$action “$name”';
  }

  @override
  String remoteHostKeyMismatchDetail(String saved, String received, String type) {
    return 'Se a máquina foi reinstalada ou substituída, reinicie sua impressão digital nas configurações da máquina.\nGravado: $saved\nRecebido: $received ($type)';
  }

  @override
  String remoteForumCompactReplies(int count, String label) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$label respostas', one: '$label resposta');
    return '$_temp0';
  }

  @override
  String remoteForumCompactViews(int count, String label) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$label visualizações', one: '$label view');
    return '$_temp0';
  }

  @override
  String remoteForumYearDate(int year, String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Fev',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'Maio',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Out',
      '11': 'Nov',
      '12': 'Dez',
      'other': '$month',
    });
    return '$_temp0 $day, $year';
  }

  @override
  String remoteHostedMonthDate(String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Fev',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'Maio',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Out',
      '11': 'Nov',
      '12': 'Dez',
      'other': '$month',
    });
    return '$_temp0 $day';
  }

  @override
  String remoteHostedYearDate(int year, String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Fev',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'Maio',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Out',
      '11': 'Nov',
      '12': 'Dez',
      'other': '$month',
    });
    return '$_temp0 $day, $year';
  }

  @override
  String remoteForumTenThousands(String value) {
    return '$value × 10,000';
  }

  @override
  String get remoteForumSemanticsSeparator => ', ';

  @override
  String remoteHostKeyVerifyCommand(String command) {
    return 'Executar $command no hospedeiro para ver a mesma impressão digital. O DSH recusará a ligação se mudar.';
  }

  @override
  String remoteSshInstallCommand(String command) {
    return 'O DSH não está instalado? Executar $command no hospedeiro.';
  }

  @override
  String remoteRelayProvider(String project) {
    return 'Serviço por $project';
  }

  @override
  String remoteRelayProviderServer(String project, String server) {
    return 'Serviço por $project · Servidor atual: $server';
  }

  @override
  String remoteQuotedHostName(String name) {
    return '“$name”';
  }

  @override
  String remoteErrorDetail(String message, String detail) {
    return '$message ($detail)';
  }

  @override
  String get riskDontShowAgain => 'Não mostrar novamente';

  @override
  String get riskAskAi => 'Tem dúvidas? Pergunte à IA';

  @override
  String get riskConfirmAlwaysAction => 'Ignorar confirmação';

  @override
  String get riskFullAccessAction => 'Ativar acesso completo';

  @override
  String get riskAutoReviewAction => 'Ativar revisão automática';

  @override
  String get riskAllowForChatTitle => 'Permitir todas as ações nesta conversa?';

  @override
  String get riskAllowForChatBody =>
      'Comandos e alterações nesta conversa serão executados sem pedir confirmação. Você pode desativar essa opção acima da caixa de mensagens a qualquer momento.';

  @override
  String get riskAllowForChatAction => 'Permitir tudo';

  @override
  String get riskPetOverlayTitle => 'Mostrar sobre outros aplicativos?';

  @override
  String get riskPetOverlayBody =>
      'Ative “Exibir sobre outros aplicativos” para o DSH Go nas configurações do sistema para que o mascote apareça fora do app.';

  @override
  String get riskPetOverlayAction => 'Abrir configurações';

  @override
  String get askAiTooltip => 'Perguntar à IA';

  @override
  String get askAiHelpTitle => 'Ajuda';

  @override
  String get askAiHelpSubtitle => 'Pergunte à IA sobre qualquer item desta tela';

  @override
  String askAiAboutApp(String question) {
    return 'Sobre o aplicativo DSH Go: $question';
  }

  @override
  String askAiWithGuide(String question) {
    return 'Sobre o aplicativo DSH Go: $question\nResponda com base no guia anexo.';
  }

  @override
  String get askAiNoGuide => 'Este host não tem o guia do DSH Go, então as respostas podem estar imprecisas';

  @override
  String get askAiQuestionOverview => 'O que o DSH Go pode fazer e por onde devo começar?';

  @override
  String get askAiQuestionPhoneControl => 'Como funciona o controle do celular e quais são os riscos?';

  @override
  String get askAiQuestionPhoneAlways =>
      'O que muda ao selecionar “Nunca perguntar” no controle do celular e por que isso é mais arriscado?';

  @override
  String get askAiQuestionAppRules =>
      'Para que serve a lista de aplicativos no controle do celular? Quais são os riscos de permitir aplicativos bancários e de pagamento?';

  @override
  String get askAiQuestionFullAccess => 'O que acontece quando ativo o acesso completo e quais são os riscos?';

  @override
  String get askAiQuestionPhoneFiles =>
      'Com “Acessar arquivos do celular” ativado, quais arquivos a IA pode ler e alterar? Como desativar essa opção?';

  @override
  String get askAiQuestionAllowForChat => 'O que a opção “Permitir nesta conversa” autoriza e como desativá-la?';

  @override
  String get askAiQuestionPlugins => 'O que os plugins podem fazer e quais cuidados devo ter com plugins de terceiros?';

  @override
  String get askAiQuestionRemote =>
      'Como conecto meu computador ou servidor e qual é a diferença em relação a este celular?';

  @override
  String get schemaDocumentationTitle => 'Descrições do campo';

  @override
  String get schemaDocumentationOverview => 'Visão geral';

  @override
  String get schemaDocumentationEach => 'Cada item';

  @override
  String schemaDocumentationPosition(int position) {
    return 'Item $position';
  }

  @override
  String schemaDocumentationOption(int option) {
    return 'Opção $option';
  }

  @override
  String get searchApiKey => 'Chave da API';

  @override
  String get searchNeedsLocal => 'Disponível no motor deste celular';

  @override
  String get searchNeedsPhoneControl => 'Disponível uma vez que o controle do telefone está ligado';

  @override
  String get searchNeedsNativeUi => 'Disponível na interface nativa';

  @override
  String get searchNeedsEngineField => 'Disponível quando a máquina o tem';

  @override
  String get searchNeedsChat => 'Disponível com um chat aberto';

  @override
  String get searchKwTheme => 'aparência, cores, cores, acento, ícones';

  @override
  String get searchKwPets => 'animal de estimação, animais de estimação, companhia, whale, sobreposição';

  @override
  String get searchKwPerformance => 'bateria, smooth, lag,lite,full,speed';

  @override
  String get searchKwVoice => 'reconhecimento de fala, ditado, microfone, microfone, voz';

  @override
  String get searchKwNotifications => 'alertas, empurrão, banner, som';

  @override
  String get searchKwReplyPrefs => 'sobre mim, estilo, tom, instruções, AGENTES.md';

  @override
  String get searchKwSharedLinks => 'ligações, compartilhamento, compartilhamento, ligação pública';

  @override
  String get searchKwPhone => 'acessibilidade, automação, tap, telefone de controle';

  @override
  String get searchKwAppRules => 'apps, blocklist, allowlist,deny,app list';

  @override
  String get searchKwDnd => 'dnd, shizuku, adb, background';

  @override
  String get searchKwEngine => 'motor, tempo de execução, arranque, paragem, reiniciar, DSH';

  @override
  String get searchKwBackground =>
      'manter-se vivo, atividade de fundo, otimização de baterias, arranque automático, morto';

  @override
  String get searchKwSystemAccess =>
      'permissions,grant, overlay,display sobre outros aplicativos,acessibilidade, pop-ups de background,microfone, acesso a arquivos, permissão de notificação, configurações restritas';

  @override
  String get searchKwDiagnostics => 'logs, problemas, relatórios, erros';

  @override
  String get searchKwModels =>
      'provedores de modelos, fornecedores, provedor, modelo de switch, OpenRouter, ChatGPT,Claude';

  @override
  String get searchKwEngineParams => 'configurações do motor, avançados, parâmetros, submarinos, comandos';

  @override
  String get searchKwSubagent => 'configurações do subagente, profundidade, concorrência, subtarefas';

  @override
  String get searchKwAgentLoop => 'loop, paralelo, chamadas de ferramentas';

  @override
  String get searchKwShell => 'commands, timeout, output, terminal, shell, bash';

  @override
  String get searchKwWebSearch => 'busca, internet, navegação, chave api';

  @override
  String get searchKwGeneral => 'geral, configurações da web';

  @override
  String get searchKwPluginInventory => 'inventário, plugins instalados, bundles';

  @override
  String get searchKwPlugins => 'extensões, mercado, instalação, mercado';

  @override
  String get searchKwAllFeatures => 'características, catálogo, tudo';

  @override
  String get searchKwAccount => 'conta, saldo, topo, assina, assina, api chave, usa,DeepSeek';

  @override
  String get searchKwRemote => 'remoto, ssh, computador, servidor, DSH Remote, connect';

  @override
  String get searchKwPermission =>
      'permissões, aprovação, não perguntar, ler apenas, acesso completo, comandos de execução automática';

  @override
  String get searchKwAgentPresets => 'predefinições, modo, modo agente';

  @override
  String get searchKwUiMode => 'nativo, web, modo web, interface';

  @override
  String get searchKwLanguage => 'chinês, inglês, locale';

  @override
  String get searchKwAutoCommands => 'não pergunte, auto aprovar, acesso completo, sem confirmação';

  @override
  String get searchKwPhoneFiles => 'armazenamento, arquivos, downloads, fotos';

  @override
  String get searchKwVisualReplies => 'gráficos, cartões, visual, opções';

  @override
  String get searchKwTextSize => 'fonte, tamanho, tamanho do texto, texto maior';

  @override
  String get searchKwFoldTurns => 'colapso, dobra, passos';

  @override
  String get searchKwWebPhoneLayout => 'layout do telefone web, layout';

  @override
  String get searchKwShareConfig => 'compartilhamento, exportação, código de compartilhamento, config';

  @override
  String get searchKwOpenWeb => 'web, navegador, web ui';

  @override
  String get searchKwSafeMode => 'modo seguro, deixar modo seguro, solução de problemas';

  @override
  String get searchKwVersion => 'versão, sobre, construir';

  @override
  String get searchKwUpdate => 'atualização, atualização, nova versão';

  @override
  String get searchKwUpdateAuto => 'atualização automática, atualização';

  @override
  String get searchKwHelp => 'ajuda, guia, pergunta ai, como';

  @override
  String get searchKwCommunity => 'grupo, fórum, feedback, grupo de bate-papo';

  @override
  String get searchKwStar => 'github,star';

  @override
  String get searchKwLicenses => 'licença, código aberto';

  @override
  String get searchKwDarkMode => 'escuro, claro, escuro modo, noite, theme, sistema, aparência';

  @override
  String get searchKwAccent => 'cor, cor, acento, paleta, papel de parede';

  @override
  String get searchKwTileStyle => 'estilo de ícones, tiles';

  @override
  String get searchKwAppIcon => 'ícone do lançador, ícone';

  @override
  String get searchKwPetSize => 'tamanho do animal de estimação';

  @override
  String get searchKwPetQuiet => 'Calma, calma, calma';

  @override
  String get searchKwPetOutside => 'sobreposição, flutuando animal de estimação, aplicativo externa';

  @override
  String get searchKwPetDisplayWhen => 'exibição pet, quando mostrar';

  @override
  String get searchKwBlur => 'borrado, vidro, congelado';

  @override
  String get searchKwAnimations => 'animação, movimento, redução de movimento';

  @override
  String get searchKwNotifyEnabled => 'notificações sobre,desligar notificações';

  @override
  String get searchKwNotifyDone => 'resposta feita, acabado';

  @override
  String get searchKwNotifyFailed => 'erro, falhou, parou';

  @override
  String get searchKwNotifyApproval => 'aprovação, esperando por você';

  @override
  String get searchKwNotifyQuestion => 'Pergunta, pergunta-te';

  @override
  String get searchKwNotifySystem => 'som, banner, tela de bloqueio, sistema';

  @override
  String get searchKwPhoneConfirm => 'Não pergunte, confirme, sempre pergunte, sem confirmação';

  @override
  String get searchKwPhoneAutoCollapse => 'barra flutuante, colapso, bolha';

  @override
  String get searchKwPhoneReturn => 'Volta, volta';

  @override
  String get searchKwPhoneBackgroundGuide => 'confirmação de fundo, retorno';

  @override
  String get searchKwAutoStart => 'início automático, lançamento';

  @override
  String get searchKwAutoSafe => 'modo seguro, modo seguro automático';

  @override
  String get searchKwEngineReset => 'reset,wipe,restore';

  @override
  String get searchKwEngineUninstall => 'desinstalar, remover, espaço livre';

  @override
  String get searchKwAddProvider => 'adicionar modelo, novo provedor, modelo personalizado, url base';

  @override
  String get searchKwSubagentDepth => 'profundidade, níveis';

  @override
  String get searchKwParallelCalls => 'chamadas paralelas, simultâneas';

  @override
  String get searchKwCommandTimeout => 'tempo limite, limite de tempo';

  @override
  String get searchKwWebSearchKey => 'chave de pesquisa, chave de pesquisa web';

  @override
  String get searchKwChatLogUpload => 'privacidade, logs, logs de carregamento, telemetria';

  @override
  String get searchKwAddSshHost => 'ssh, add host, connect computer';

  @override
  String get searchKwRemoteAutoConnect => 'conexão automática, no lançamento';

  @override
  String get searchKwPermissionCurrent => 'permite esta conversa, esta conversa';

  @override
  String get searchKwPermissionDefault =>
      'permissão padrão, somente leitura, espaço de trabalho, acesso completo, comandos de execução automática, não pergunte';

  @override
  String get searchSettingsHint => 'Pesquisar nas configurações';

  @override
  String get searchSuggestDark => 'Modo escuro';

  @override
  String get searchSuggestBackground => 'Contexto';

  @override
  String get searchSuggestPermission => 'Permissões';

  @override
  String get searchSuggestTextSize => 'Tamanho do texto';

  @override
  String get searchCommon => 'Frequentes';

  @override
  String get searchRecent => 'Recente';

  @override
  String get searchFeatures => 'Características';

  @override
  String get searchNoResults => 'Sem configurações correspondentes';

  @override
  String searchAskAi(String query) {
    return 'Pergunte à IA: “$query”';
  }

  @override
  String get searchKwPersonalization => 'personalização, preferências, estilo';

  @override
  String get searchKwInterface => 'nativo, web, modo web, app web, geral';

  @override
  String get searchKwPrivacy => 'privacidade, dados, diários, compartilhamento, estatísticas';

  @override
  String get searchKwAbout => 'sobre, versão, atualização, licenciamento';

  @override
  String get searchKwPhoneConfirmEntry => 'confirmação, controle de telefone, não pergunte';

  @override
  String get searchKwWebCodingView => 'codificação view, work view, web';

  @override
  String get searchKwWebCollapse => 'etapas de trabalho, colapso, web';

  @override
  String get searchKwWebBusySend => 'enviar, fila, enquanto IA funciona';

  @override
  String get searchKwPluginsMarket => 'mercado de plugins, plugins de instalação, marketplace';

  @override
  String get searchKwUsageStats =>
      'estatísticas, estatísticas, dados de uso, análises, telemetria, anonymous,privacy,data';

  @override
  String get setupAppearanceTitle => 'Escolha a aparência';

  @override
  String get setupAppearanceMessage => 'Você pode alterar isso a qualquer momento em Configurações';

  @override
  String get setupLightMode => 'Modo leve';

  @override
  String get setupCapsulePreparing => 'Preparando o ambiente de execução';

  @override
  String setupCapsuleProgress(int percent) {
    return 'Instalação $percent%';
  }

  @override
  String setupCapsuleProgressSemantics(int percent) {
    return 'Preparando o ambiente de execução: $percent% concluído';
  }

  @override
  String get setupCapsuleReady => 'Ambiente de execução pronto';

  @override
  String get setupCapsuleFailed => 'Falha na instalação';

  @override
  String get setupWaitingBody => 'A configuração continuará automaticamente quando estiver pronta';

  @override
  String get setupNotifyWhenDone => 'Avisaremos quando terminar';

  @override
  String get setupAwaitSignIn => 'O acesso ao DeepSeek será aberto quando estiver pronto';

  @override
  String get shellApiKeyPrefixWarning =>
      'Chaves DeepSeek geralmente começam com sk-. Verifique se copiou a chave certa.';

  @override
  String get shellApiKeyIncompleteWarning => 'Esta chave parece incompleta. Vê se copiaste tudo.';

  @override
  String get shellBrowserUrlCopied => 'Não foi possível abrir o seu navegador. URL copiado.';

  @override
  String get shellSaveTryAgain => 'Não foi possível salvar. Tente novamente.';

  @override
  String get shellApiKeyUpdated => 'Chave API atualizada';

  @override
  String get shellReplaceApiKey => 'Substituir a chave da API';

  @override
  String get shellEnterApiKey => 'Digite a chave de API';

  @override
  String get shellApiKeyBilling => 'Faturado pela plataforma DeepSeek com base no uso';

  @override
  String get shellSaving => 'Salvando';

  @override
  String get shellSaveContinue => 'Salvar e continuar';

  @override
  String get shellSetUpLater => 'Configurar mais tarde';

  @override
  String get shellClearField => 'Limpar';

  @override
  String get shellShow => 'Mostrar';

  @override
  String get shellApiKeyEncrypted => 'Criptografada neste celular';

  @override
  String get shellGetApiKey => 'Obter a chave da API';

  @override
  String get shellConnectDeepSeek => 'Conectar DeepSeek';

  @override
  String get shellConnectDeepSeekMessage => 'Inicie sessão no DeepSeek para iniciar. Nenhuma chave API necessária.';

  @override
  String get shellAccountSignInUnsupported => 'Este mecanismo não aceita login com conta';

  @override
  String get shellSignInDeepSeek => 'Iniciar sessão com DeepSeek';

  @override
  String get shellUseApiKey => 'Usar a chave da API';

  @override
  String get shellOtherProviders => 'Outros fornecedores';

  @override
  String shellOnboardingStep(int step, int steps) {
    return 'Passo $step de $steps';
  }

  @override
  String get shellRuntimeUpdating => 'Atualizando o ambiente de execução';

  @override
  String get shellRuntimePreparing => 'Preparando o ambiente de execução';

  @override
  String get shellRuntimeReady => 'Pronto';

  @override
  String get shellRuntimeIncomplete => 'Instalação incompleta';

  @override
  String get shellRuntimeFilesKept => 'Suas conversas e arquivos permanecem';

  @override
  String get shellRuntimeFirstSetup => 'A primeira configuração leva um ou dois minutos';

  @override
  String get shellRuntimeContinuing => 'Continuando em breve';

  @override
  String get shellRuntimeRestoreFailed => 'Não foi possível restaurar o conteúdo salvo';

  @override
  String get shellRuntimeExtractFailed => 'Não foi possível extrair arquivos';

  @override
  String get shellInstallLogs => 'Logs de instalação';

  @override
  String get shellRuntimeLocalOnly => 'Tudo funciona neste celular.';

  @override
  String get shellRuntimeContinueWithoutKept => 'Continuar sem restaurar';

  @override
  String get shellRuntimeAlmostDone => 'Quase pronto.';

  @override
  String shellRuntimeSecondsRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sobre $count segundos',
      one: 'Cerca de 1 segundo',
    );
    return '$_temp0';
  }

  @override
  String shellRuntimeMinutesRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sobre $count minutos',
      one: 'Cerca de 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String get shellEngineLogs => 'Logs do mecanismo';

  @override
  String get shellWelcomeMessage => 'O agente DeepSeek,\nno seu bolso';

  @override
  String get shellGetStarted => 'Iniciar';

  @override
  String get shellSearchChats => 'Procurar chats';

  @override
  String get shellCollapseChatList => 'Recolher a lista de conversas';

  @override
  String get shellExpandChatList => 'Expandir a lista de conversas';

  @override
  String get shellChatList => 'Conversas';

  @override
  String get shellChatDetails => 'Detalhes do chat';

  @override
  String get shellCollapseDetails => 'Recolher detalhes';

  @override
  String get shellExpand => 'Expandir';

  @override
  String get shellUndo => 'Desfazer';

  @override
  String shellFolderDeleted(String name) {
    return 'Pasta “$name” excluída';
  }

  @override
  String shellMovedToFolder(String name) {
    return 'Transferido para “$name”';
  }

  @override
  String get shellMovedOutOfFolder => 'Movido para fora da pasta';

  @override
  String get shellUnpinFailed => 'Não consegui desamarrar. Tente novamente mais tarde.';

  @override
  String get shellPinFailed => 'Não foi possível fixar. Tente novamente mais tarde.';

  @override
  String shellChatsUnpinned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count conversas desafixadas',
      one: '1 conversa desafixada',
    );
    return '$_temp0';
  }

  @override
  String shellChatsPinned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count conversas fixadas',
      one: '1 conversa fixada',
    );
    return '$_temp0';
  }

  @override
  String get shellArchiveFailed => 'Não foi possível arquivar. Tente novamente mais tarde.';

  @override
  String shellChatsStoppedArchived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count conversas interrompidas e arquivadas',
      one: '1 conversa interrompida e arquivada',
    );
    return '$_temp0';
  }

  @override
  String shellChatsArchived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count conversas arquivadas',
      one: '1 conversa arquivada',
    );
    return '$_temp0';
  }

  @override
  String shellFilterLabel(String label) {
    return 'Filtro: $label';
  }

  @override
  String get shellFolders => 'Pastas';

  @override
  String get shellNoRunningChats => 'Sem conversas em execução';

  @override
  String get shellNoPendingChats => 'Nenhuma conversa precisa de aprovação';

  @override
  String get shellNoUnreadChats => 'Sem conversas não lidas';

  @override
  String get shellNoChatsYet => 'Sem conversas ainda';

  @override
  String shellFolderLabel(String name) {
    return 'Pasta “$name”';
  }

  @override
  String shellFolderChatCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pasta “$name”, $count conversas',
      one: 'Pasta “$name”, 1 conversa',
    );
    return '$_temp0';
  }

  @override
  String get shellSort => 'Ordenar';

  @override
  String get shellRecentActivity => 'Atividade recente';

  @override
  String get shellCreatedTime => 'Data de criação';

  @override
  String get shellNewFolder => 'Nova pasta';

  @override
  String get shellManageFolders => 'Gerenciar pastas';

  @override
  String get shellMultiSelect => 'Selecionar';

  @override
  String get shellFolderNameExists => 'Já existe uma pasta com este nome';

  @override
  String get shellEditFolder => 'Editar pasta';

  @override
  String get shellFolderMark => 'Marcar';

  @override
  String shellFolderColor(int number) {
    return 'Cor $number';
  }

  @override
  String get shellMoveToFolder => 'Mover para a pasta';

  @override
  String get shellMoveOutOfFolder => 'Mover para fora da pasta';

  @override
  String get shellDeleteFolder => 'Apagar pasta';

  @override
  String get shellDragToReorder => 'Arrastar para reordenar';

  @override
  String get shellSelectChats => 'Selecionar chats';

  @override
  String shellSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count selecionadas',
      one: '1 selecionada',
    );
    return '$_temp0';
  }

  @override
  String get shellDeselectAll => 'Desmarcar tudo';

  @override
  String get shellSelectAll => 'Selecionar todos';

  @override
  String get shellUnpin => 'Desafixar';

  @override
  String get shellArchive => 'Arquivar';

  @override
  String get shellCurrentlyRunning => 'Em execução';

  @override
  String get shellUnread => 'Não lidas';

  @override
  String get shellPinned => 'Fixadas';

  @override
  String get shellEngineNotRunning => 'O motor não está em execução';

  @override
  String shellHostNotConnected(String name) {
    return 'Ainda não conectado a “$name”';
  }

  @override
  String get shellSearchAfterConnecting => 'Conectar à pesquisa';

  @override
  String get shellChatsLoadFailed => 'Não foi possível carregar chats';

  @override
  String shellSearchHostChats(String name) {
    return 'Procurar chats em “$name”';
  }

  @override
  String get shellSearchTitlesHint => 'Procurar títulos, incluindo chats arquivados';

  @override
  String get shellSearchContentHint => 'Procurar títulos e conteúdo, incluindo chats arquivados';

  @override
  String get shellLoadingChatsEllipsis => 'Carregando conversas…';

  @override
  String get shellNoMatchingChats => 'Sem conversas correspondentes';

  @override
  String get shellSearchDifferentKeywords => 'Tente outra palavra- chave, ou palavras separadas com espaços';

  @override
  String get shellArchived => 'Arquivado';

  @override
  String get shellRestoreBeforeOpening => 'Restaurar esta conversa arquivada para abri- la';

  @override
  String get shellRestoreAndOpen => 'Restaurar e abrir';

  @override
  String get shellRestoreFailed => 'Não foi possível restaurar. Tente novamente mais tarde.';

  @override
  String get shellSearchingMessages => 'A pesquisar o conteúdo da mensagem...';

  @override
  String get shellHostTitleSearchOnly => 'Esta máquina só suporta a pesquisa de título';

  @override
  String get shellContentSearchFailed =>
      'Não foi possível pesquisar o conteúdo. A mostrar apenas a correspondência do título.';

  @override
  String get shellContentSearchLimit => 'A pesquisa de conteúdo mostra as 20 conversas mais relevantes';

  @override
  String get shellMoveToOtherFolder => 'Mover para outra pasta';

  @override
  String get shellArchiveStopsTurn => 'A rodada atual irá parar';

  @override
  String get shellRenameFailed => 'Não foi possível renomear. Tente novamente mais tarde.';

  @override
  String shellChatStoppedArchived(String title) {
    return 'Parado e arquivado “$title”';
  }

  @override
  String shellChatArchived(String title) {
    return 'Arquivado “$title”';
  }

  @override
  String get shellRenameChat => 'Mudar o Nome da Conversa';

  @override
  String get shellChatTitle => 'Título do conversa';

  @override
  String shellUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count não lido', one: '1 não lido');
    return '$_temp0';
  }

  @override
  String get shellLoadingChats => 'Carregando conversas';

  @override
  String get shellWorkspaceNoChats => 'Ainda não há conversas aqui';

  @override
  String get shellWorkspaceNewChatsHint =>
      'Novas conversas vão neste espaço de trabalho. As conversas anteriores não são movidas para aqui automaticamente; encontre- as em Todas as conversas.';

  @override
  String get shellNewChatsHint => 'Novas conversas aparecem aqui';

  @override
  String get shellEngineStarting => 'O motor está a iniciar';

  @override
  String get shellChatsAfterStarting => 'As suas conversas aparecem assim que começa';

  @override
  String get shellStartEngine => 'Iniciar o motor';

  @override
  String get shellEngineStatusHint => 'Ver o estado em “Engine”';

  @override
  String shellHostUnreachable(String name) {
    return 'Não é possível alcançar “$name”';
  }

  @override
  String shellHostReconnecting(String name) {
    return 'Religar a “$name”…';
  }

  @override
  String get shellRetryNow => 'Tente de novo.';

  @override
  String shellHostConnecting(String name) {
    return 'Conectando a “$name”…';
  }

  @override
  String get shellHostChatsAfterConnecting => 'As conversas desta máquina aparecem uma vez conectadas';

  @override
  String shellCurrentHostLabel(String name, String view) {
    return 'Máquina atual: $name, $view. Mudar de máquina';
  }

  @override
  String get shellChatGone => 'Esta conversa desapareceu.';

  @override
  String get shellAccentMist => 'Névoa';

  @override
  String get shellAccentDaiqing => 'Turquesa';

  @override
  String get shellAccentDusk => 'Crepúsculo';

  @override
  String get shellAccentTurquoise => 'Aqua';

  @override
  String get shellAccentAmber => 'Âmbar';

  @override
  String get shellAccentGraphite => 'Ardósia';

  @override
  String get shellHideTurnFooter => 'Rodar o rodapé';

  @override
  String get shellHideTokenCount => 'Contagem de itens';

  @override
  String get shellHideReasoning => 'Pensar';

  @override
  String get shellHideActivityStrip => 'Faixa de atividade';

  @override
  String get shellHideWhaleTail => 'Cauda de baleia';

  @override
  String get shellHideTodoPill => 'Barra de tarefas';

  @override
  String get shellHideGoalBar => 'Barra de objetivos';

  @override
  String get shellToday => 'Hoje';

  @override
  String get shellThisWeek => 'Esta semana';

  @override
  String get shellEarlier => 'Anteriormente';

  @override
  String get shellSeatNative => 'Nativo';

  @override
  String get shellSeatIsland => 'Web Incorporada';

  @override
  String get shellSeatWeb => 'Abrir na Web DSH';

  @override
  String get shellPlugins => 'Plugins';

  @override
  String get shellHeaderActions => 'Botões de cabeçalho';

  @override
  String get shellAllHidden => 'Tudo escondido';

  @override
  String shellSettingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count itens', one: '1 ponto');
    return '$_temp0';
  }

  @override
  String get shellQuickActions => 'Ações rápidas';

  @override
  String get shellSuggestionCards => 'Cartões de sugestões';

  @override
  String shellSuggestionCardCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count cartas', one: '1 carta');
    return '$_temp0';
  }

  @override
  String get shellDrawerGroups => 'Grupos de gavetas';

  @override
  String get shellDrawerSort => 'Ordem de ordenação da gaveta';

  @override
  String get shellDrawerFilter => 'Filtro de gaveta';

  @override
  String get shellPending => 'Pendente';

  @override
  String get shellAll => 'Tudo';

  @override
  String get shellDensity => 'Densidade';

  @override
  String get shellCompact => 'Compacto';

  @override
  String get shellSpacious => 'Espaçoso';

  @override
  String get shellThemeMode => 'Modo de aparência';

  @override
  String get shellAccentColor => 'Cor do sotaque';

  @override
  String get shellPet => 'Mascotes';

  @override
  String get shellConfigured => 'Definir';

  @override
  String get shellShortcuts => 'Atalhos de teclado';

  @override
  String get shellConfigFileTooLarge => 'Arquivo excede 64 KiB';

  @override
  String get shellConfigRootNotObject => 'Nível superior deve ser um objeto';

  @override
  String get shellConfigVersionMissing => 'Versão em falta';

  @override
  String get shellConfigVersionNotInt => 'a versão deve ser um inteiro';

  @override
  String get shellConfigVersionTooLow => 'versão começa em 1';

  @override
  String shellConfigVersionTooHigh(int version) {
    return 'Atualizar o aplicativo para usar a versão $version';
  }

  @override
  String get shellConfigNotObject => 'Esperava um objeto';

  @override
  String get shellConfigNotArray => 'Esperava um array';

  @override
  String get shellConfigNotString => 'Esperava um texto';

  @override
  String get shellConfigNotBool => 'Espera-se verdadeiro ou falso';

  @override
  String get shellConfigEmpty => 'Não pode estar vazio';

  @override
  String get shellConfigUnknownKey => 'Chave desconhecida, ignorada';

  @override
  String get shellConfigDuplicateKey => 'Duplicar a chave, apenas a última se aplica';

  @override
  String get shellConfigDuplicateItem => 'Duplicar, ignorar';

  @override
  String shellConfigMissing(String key) {
    return 'Faltando $key';
  }

  @override
  String shellConfigTruncated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Superior a 10 % $count caracteres, truncados',
      one: 'Superior a 1 carácter, truncado',
    );
    return '$_temp0';
  }

  @override
  String shellConfigTooLong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Superior a 10 % $count caracteres',
      one: 'Superior a 1 carácter',
    );
    return '$_temp0';
  }

  @override
  String shellConfigTooMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Até $count itens, extras ignorados',
      one: 'Até 1 item, extras ignorados',
    );
    return '$_temp0';
  }

  @override
  String get shellConfigValueNoun => 'valor';

  @override
  String shellConfigUnsupportedValue(String noun, String value) {
    return 'Não suportado $noun “$value”';
  }

  @override
  String get shellConfigHeaderItem => 'Esperava um ID ou objeto de botão';

  @override
  String get shellConfigHeaderId => 'IDs podem usar letras, números e -, começando com uma letra minúscula';

  @override
  String get shellConfigIdTaken => 'ID duplicado';

  @override
  String get shellConfigCommandSlash => 'Nomes de comandos não incluem /, removidos';

  @override
  String get shellConfigCommandName => 'Nomes de comandos só podem usar letras, números e : .   -';

  @override
  String get shellConfigNoNewline => 'Quebras de linha não são permitidas';

  @override
  String get shellConfigHttpsOnly => 'Somente links HTTPS são suportados';

  @override
  String get shellConfigBadUrl => 'Formato de ligação inválido';

  @override
  String get shellConfigAccentFormat => 'Usar o # RRGGBB para as cores';

  @override
  String get shellConfigAccentBoth => 'Escolha isto ou acentoPreset; acentoPreset used';

  @override
  String get shellConfigPetId => 'IDs só podem usar letras minúsculas, números e -';

  @override
  String get shellConfigKeysFormat => 'Formato inválido, por exemplo ctrl+k';

  @override
  String get shellConfigSystemKey => 'Chaves do sistema não são permitidas';

  @override
  String get shellConfigNeedModifier => 'Incluir ctrl ou alt';

  @override
  String get shellConfigReservedKey => 'Usado pelo sistema ou teclado';

  @override
  String shellConfigDuplicateShortcut(String pointer) {
    return 'Duplicados $pointer';
  }

  @override
  String get shellConfigSlotName => 'Formato de nome de fenda inválido';

  @override
  String get shellConfigUnknownSlot => 'Este slot ainda não está em DSH, mantido para mais tarde';

  @override
  String get shellConfigUnseatableSlot => 'Os plug-ins não são suportados aqui';

  @override
  String get shellConfigPackageName => 'Formato de nome de pacote inválido';

  @override
  String get shellConfigActionNoun => 'ação';

  @override
  String get shellConfigPageNoun => 'página';

  @override
  String get shellConfigButtonNoun => 'botão';

  @override
  String get shellConfigIconNoun => 'ícone';

  @override
  String get shellConfigNotTextFile => 'Nenhum arquivo de texto';

  @override
  String shellJsonPosition(int line, int column, String reason) {
    return 'Linha $line, coluna $column: $reason';
  }

  @override
  String get shellJsonEmptyFile => 'O arquivo está em branco';

  @override
  String get shellJsonExtraContent => 'Conteúdo extra no final';

  @override
  String get shellJsonIncompleteFile => 'O arquivo está incompleto';

  @override
  String get shellJsonCommentsUnsupported => 'Comentários não são suportados';

  @override
  String get shellJsonDoubleQuotes => 'Strings precisam de aspas duplas';

  @override
  String get shellJsonMissingValue => 'Falta um valor aqui';

  @override
  String shellJsonUnknownContent(String value) {
    return 'Conteúdo não reconhecido “$value”';
  }

  @override
  String get shellJsonTooDeep => 'O ninho é muito profundo';

  @override
  String get shellJsonExtraComma => 'Nota extra';

  @override
  String get shellJsonQuotedKey => 'Chaves precisam de aspas duplas';

  @override
  String get shellJsonExpectedKey => 'Esperava uma chave aqui';

  @override
  String get shellJsonMissingColon => 'Falta um cólon após a chave';

  @override
  String get shellJsonMissingComma => 'Falta uma vírgula aqui.';

  @override
  String shellJsonUnexpectedContent(String value) {
    return 'Inesperado “$value” aqui';
  }

  @override
  String get shellJsonUnterminatedString => 'Texto não terminado';

  @override
  String get shellJsonBadEscape => 'Escape de texto inválido';

  @override
  String get shellJsonStringNewline => 'Strings não podem conter quebras de linha literais';

  @override
  String get shellJsonControlCharacter => 'O texto contém um caracter de controle';

  @override
  String get shellJsonBadNumber => 'Formato de número inválido';

  @override
  String shellSkillInstallPrompt(String skill) {
    return 'Instalar o DSH Go habilidade de interface $skill nesta máquina:';
  }

  @override
  String shellSkillInstallDirectory(String skill) {
    return '1. Crie a pasta de destino `\$DSH_HOME/skills/$skill/` se necessário (ou `~/.dsh/skills/$skill/` se `DSH_HOME` não estiver definido).';
  }

  @override
  String get shellSkillInstallFiles =>
      '2. Escreva cada arquivo abaixo em seu caminho relativo dado, mantendo o conteúdo exatamente como fornecido.';

  @override
  String get shellSkillInstallConfirm => '4. Diga-me quando está instalado.';

  @override
  String shellSkillInstallFile(String path) {
    return 'Arquivo `$path`:';
  }

  @override
  String get shellFromUiJson => 'De ui.json';

  @override
  String get shellViewSource => 'Ver fonte';

  @override
  String get shellSourcePosition => 'Localização';

  @override
  String get shellRestoreDefaults => 'Reiniciar como padrão';

  @override
  String get shellConfigNotApplied => 'Não aplicado';

  @override
  String shellConfigDroppedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count questões não aplicadas',
      one: '1 questão não aplicada',
    );
    return '$_temp0';
  }

  @override
  String shellConfigAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Aplicado $count itens',
      one: 'Aplicado 1 item',
    );
    return '$_temp0';
  }

  @override
  String get shellInterfaceConfig => 'Configuração da UI';

  @override
  String get shellSkillNotInstalled => 'Habilidade não instalada';

  @override
  String get shellInstallInterfaceSkill => 'Instalar a habilidade da interface';

  @override
  String get shellInstallInterfaceSkillMessage =>
      'Uma vez instalado, IA pode ajustar a interface do aplicativo como você pedir';

  @override
  String get shellNoUiJson => 'No ui.json';

  @override
  String get shellConfigUsingPrevious => 'Não aplicado, ainda usando a configuração anterior';

  @override
  String get shellConfigDroppedHeading => 'Não aplicado';

  @override
  String get shellConfigNotesHeading => 'Avisos';

  @override
  String get shellConfigAppliedHeading => 'Aplicado';

  @override
  String shellConfigValueOptions(String noun, String value, String options) {
    return 'Não suportado $noun “$value”, opções: $options';
  }

  @override
  String get shellListSeparator => ', ';

  @override
  String shellSkillInstallCheck(String command) {
    return '3. Executar $command depois de escrever os arquivos. Se for executado, a instalação está completa (uma mensagem sobre ui.json ainda não existente é normal).';
  }

  @override
  String get shellSemanticsSeparator => ', ';

  @override
  String shellChatsArchivedPartial(int count, int failed) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Arquivado $count chats',
      one: 'Arquivado 1 chat',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failed,
      locale: localeName,
      other: 'não foi possível arquivar $failed chats',
      one: 'não foi possível arquivar 1 chat',
    );
    return '$_temp0; $_temp1';
  }

  @override
  String starPromptTitle(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: 'Eu fiz-lhe companhia em DSH Go para $hours horas agora~',
      one: 'Eu fiz-lhe companhia em DSH Go por uma hora agora~',
      zero: 'Eu fiz você companhia em DSH Go por meia hora agora~',
    );
    return '$_temp0';
  }

  @override
  String get starPromptBody =>
      'DSH Go é livre e código aberto. Se tornou seu telefone um pouco mais agradável de usar, por favor, dê - lhe uma Estrela — significa muito para esta pequena baleia!';

  @override
  String get starPromptPlea => 'Por favorzinho. Importa mesmo!';

  @override
  String get starPromptStar => 'Estrela-o no GitHub';

  @override
  String get starPromptDone => 'Já estrelou';

  @override
  String get starPromptLater => 'Talvez mais tarde.';

  @override
  String get starSettingsTitle => 'DSH estrela Continuar GitHub';

  @override
  String get stateDiagnosticsSubject => 'Pacote de diagnóstico do DSH Go';

  @override
  String get stateStoragePermission => 'Nenhuma permissão de armazenamento para salvar em Downloads';

  @override
  String get stateDiagnosticsStorageFull => 'Não há armazenamento suficiente para criar o pacote de diagnósticos';

  @override
  String get stateDiagnosticsExportFailed => 'Não foi possível exportar o pacote de diagnósticos';

  @override
  String get stateForumUnreachable => 'Não é possível chegar ao fórum';

  @override
  String get stateSignInExpired => 'Sua sessão expirou. Entre novamente.';

  @override
  String get stateForbidden => 'Permissão negada';

  @override
  String get stateForumContentMissing => 'Conteúdo não encontrado ou excluído';

  @override
  String get stateTooManyActions => 'Demasiadas ações. Tente novamente mais tarde.';

  @override
  String get stateForumSendFailed => 'Não foi possível enviar';

  @override
  String get stateForumServerError => 'O fórum está a ter problemas';

  @override
  String get stateBrowserOpenFailed => 'Não foi possível abrir o navegador';

  @override
  String get stateSignInStartFailed => 'Não foi possível iniciar o login';

  @override
  String get stateSignInIncompleteRetry => 'O login não terminou. Tente novamente.';

  @override
  String get statePluginLabel => 'Plug-in';

  @override
  String get stateConfigLabel => 'Configuração';

  @override
  String get stateConfigShare => 'Configuração compartilhada';

  @override
  String get stateShareCode => 'Código de compartilhamento';

  @override
  String get stateCopyShareCodeFirst => 'Copiar primeiro um código de compartilhamento do Share';

  @override
  String get stateFileOpenFailed => 'Não é possível abrir este arquivo';

  @override
  String get stateLinkOpenFailed => 'Não é possível abrir este link';

  @override
  String get stateAlertPublicDone => 'Rodada concluída';

  @override
  String get stateAlertPublicFailed => 'Falha na rodada';

  @override
  String get stateAlertPublicStopped => 'Rodada interrompida';

  @override
  String get stateAlertPublicApproval => 'Um passo precisa da sua aprovação';

  @override
  String get stateAlertPublicQuestion => 'Uma pergunta precisa da sua resposta';

  @override
  String get stateAlertTurnDone => 'Esta rodada terminou';

  @override
  String get stateAlertOutputLimit => 'Terminado · Limite de saída atingido';

  @override
  String get stateAlertTurnBlocked => 'Esta rodada foi bloqueada';

  @override
  String get stateAlertEngineRestarted => 'Interrompido · Mecanismo reiniciado';

  @override
  String get stateAlertMissingKey => 'Erro · Sem chave de API definida';

  @override
  String get stateAlertTurnFailed => 'Esta rodada falhou';

  @override
  String get stateRunCommand => 'Executar o comando';

  @override
  String get stateWriteFile => 'Gravar o arquivo';

  @override
  String get stateEditFile => 'Editar arquivo';

  @override
  String get stateOpenPage => 'Abrir página web';

  @override
  String get stateWebSearch => 'Pesquisa Web';

  @override
  String get stateAlertQuestion => 'Uma pergunta para você';

  @override
  String get stateSizeSmall => 'Pequeno';

  @override
  String get stateSizeStandard => 'Padrão';

  @override
  String get stateSizeLarge => 'Grande';

  @override
  String get statePetDone => 'Feito';

  @override
  String get statePetFailed => 'Algo correu mal.';

  @override
  String get statePhoneNotReady => 'O controle do telefone não está pronto';

  @override
  String get stateBackgroundRestricted => 'A atividade em segundo plano está restrita';

  @override
  String get stateBackgroundFinish => 'Deixe as conversas terminarem em segundo plano';

  @override
  String get stateDeepSeekAccount => 'Conta DeepSeek';

  @override
  String get stateAccountUnreachable => 'Não é possível alcançar DeepSeek';

  @override
  String get stateAccountUnavailable => 'DeepSeek não está disponível';

  @override
  String get stateSignInIncomplete => 'O login não terminou';

  @override
  String get stateSignInTimeout => 'Tempo limite do login atingido';

  @override
  String get stateSignInSaveFailed => 'Não foi possível salvar os detalhes de login';

  @override
  String get stateEngineNotReady => 'O motor não está pronto';

  @override
  String get stateSignInInterrupted => 'Interrompida a entrada';

  @override
  String get stateAccountUnsupported => 'Este motor não suporta a entrada da conta';

  @override
  String get stateCheckPhoneNetwork => 'Verifique a rede do seu telefone e tente novamente';

  @override
  String get stateServiceUnavailableRetry => 'Serviço indisponível. Tente novamente mais tarde.';

  @override
  String get stateAuthorizationFailed => 'A autorização falhou. Assine novamente.';

  @override
  String get stateAuthorizationExpired => 'A página de autorização expirou. Assine novamente.';

  @override
  String get stateRestartEngineRetry => 'Reiniciar do motor e tentar novamente';

  @override
  String get stateEngineStartingRetry => 'O motor está a ligar. Tente novamente mais tarde.';

  @override
  String get stateEngineDisconnectedSignIn => 'Motor desligado. Assine novamente.';

  @override
  String get stateUpdateRuntimeOrKey => 'Atualizar o tempo de execução ou usar uma chave API';

  @override
  String get stateEngineDisconnected => 'Motor desligado';

  @override
  String get stateAgentError => 'Erro';

  @override
  String get stateNotRunning => 'Não em execução';

  @override
  String get stateAgentOneShot => 'Execução única';

  @override
  String get stateAgentContinuable => 'Continuável';

  @override
  String get stateAgentExternal => 'Tarefa externa';

  @override
  String get stateSubagent => 'Subagente';

  @override
  String get stateParentChat => 'Conversa principal';

  @override
  String get statePreparing => 'Preparando';

  @override
  String get stateIconMist => 'Névoa azul';

  @override
  String get stateIconNight => 'Noite';

  @override
  String get stateIconFrost => 'Geada branca';

  @override
  String get stateIconInk => 'Tinta';

  @override
  String get stateAppDisclaimer => 'Construído em DeepSeek Harness · Aplicativo não oficial DeepSeek';

  @override
  String get stateWallpaper => 'Papel de parede';

  @override
  String get stateFileMissing => 'Arquivo não encontrado. Pode ter sido apagado ou movido.';

  @override
  String get stateFileNoApp => 'Nenhum aplicativo neste celular pode abrir este tipo de arquivo';

  @override
  String get stateFileConnectionLimit => 'O arquivo é demasiado grande para esta ligação';

  @override
  String get stateFileReadUnsupported => 'Esta conexão não pode ler arquivos';

  @override
  String get stateArtifactImage => 'Imagem';

  @override
  String get stateArtifactDocument => 'Documento';

  @override
  String get stateArtifactSheet => 'Folha de cálculo';

  @override
  String get stateArtifactSlides => 'Apresentação';

  @override
  String get stateArtifactArchive => 'Arquivo';

  @override
  String get stateArtifactAudio => 'Áudio';

  @override
  String get stateArtifactVideo => 'Vídeo';

  @override
  String get stateArtifactWeb => 'Página Web';

  @override
  String get stateArtifactText => 'Texto';

  @override
  String get stateArtifactFile => 'Arquivo';

  @override
  String get statePrivateKeyTooLarge => 'O arquivo é demasiado grande para ser uma chave privada';

  @override
  String get stateBotTeamBusy => 'Outro DSH está usando esta equipe';

  @override
  String get stateBotOperationFailed => 'Não consegui terminar. Tente novamente.';

  @override
  String get stateBotMissing => 'Esta máquina não tem DS Bot';

  @override
  String get stateHostAuthFailed => 'A autenticação da máquina falhou';

  @override
  String get stateUnexpectedError => 'Algo correu mal.';

  @override
  String get stateGroupChat => 'Conversa de grupo';

  @override
  String get stateBotNewMessage => 'Nova mensagem bot';

  @override
  String get stateChatAgentBusy => 'A IA está ocupada. Tente novamente mais tarde.';

  @override
  String get stateChatWriterHeld => 'Esta conversa está em uso noutro lugar';

  @override
  String get stateChatModelUnavailable => 'Este modelo não está disponível';

  @override
  String get stateChatAttachmentInvalid => 'Não é possível enviar este anexo';

  @override
  String get stateChatForkUnavailable => 'Não é possível ramificar aqui';

  @override
  String get stateChatImagesTooLarge => 'As imagens são demasiado grandes. Envie menos de uma vez.';

  @override
  String get stateChatSyncInterrupted => 'Sincronização do chat interrompida';

  @override
  String get stateChatSynchronizing => 'Sincronizar chat';

  @override
  String get stateChatSyncRetry => 'Sincronizar novamente';

  @override
  String get stateChatSyncRequired => 'O chat ainda não está sincronizado. Sincronize novamente e tente novamente.';

  @override
  String get stateChatAutoApproveFailed => 'Não foi possível permitir automaticamente';

  @override
  String get stateCommandMissing => 'Comando não encontrado';

  @override
  String get stateCommandFailed => 'O comando não foi executado';

  @override
  String get stateChatStopSteered => 'Não consegui parar esta rodada. Enviado como um boi.';

  @override
  String get stateChatTextOnlyModel =>
      'Este modelo lê apenas texto. As imagens foram enviadas como arquivos. Mudar para V4.1 Flash para deixar a IA vê-los.';

  @override
  String get stateAttachmentUploadFailed => 'Não foi possível enviar o anexo';

  @override
  String get stateChatImageModelRequired =>
      'Este modelo não pode ver imagens. Mudar para o Flash V4.1 e enviar novamente.';

  @override
  String get stateSendFailed => 'Não foi possível enviar';

  @override
  String get stateChatStopFailed => 'Não conseguia parar. Tente novamente.';

  @override
  String get stateChatTurnEnded => 'Esta rodada terminou. Sua mensagem começará uma nova virada.';

  @override
  String get stateChatSteerFailed => 'Não foi possível dirigir';

  @override
  String get stateChatUndoTooLate => 'Tarde demais. A IA já leu esta mensagem.';

  @override
  String get stateChatUndoFailed => 'Não foi possível desfazer';

  @override
  String get stateChatApprovalFailed => 'Não foi possível enviar a aprovação';

  @override
  String get stateChatAnswerFailed => 'Não foi possível enviar a resposta';

  @override
  String get stateChatModelSwitchFailed => 'Não foi possível mudar de modelo';

  @override
  String get stateChatHistoryFailed => 'Não foi possível carregar o histórico';

  @override
  String get stateChatBranchLastReply => 'Ramo da última resposta de uma volta terminada';

  @override
  String get stateChatBranchFailed => 'Não foi possível ramificar';

  @override
  String get stateChatEarlierHistoryFailed => 'Não foi possível carregar o histórico anterior';

  @override
  String get stateChatNoEarlierHistory => 'Não há história antes desta mensagem. Começa uma nova conversa.';

  @override
  String get stateCommandNewDescription => 'Iniciar uma nova conversa';

  @override
  String get stateModelLabel => 'Modelo';

  @override
  String get stateCommandModelDescription => 'Mudar modelo e profundidade de pensamento';

  @override
  String get stateCommandExportLabel => 'Registros de exportação';

  @override
  String get stateCommandExportDescription =>
      'Exportar o histórico completo deste chat como ZIP para compartilhar ou salvar para Downloads';

  @override
  String get stateAllFeatures => 'Todas as funcionalidades';

  @override
  String get stateCommandFeaturesDescription => 'Acesse todos os recursos na Web DSH';

  @override
  String get stateCompactLabel => 'Compacto';

  @override
  String get stateCommandCompactDescription => 'Compactar o chat acima para libertar o contexto';

  @override
  String get statePermissionLabel => 'Permissão';

  @override
  String get stateCommandPermissionDescription =>
      'Mudar a predefinição da permissão (modo sandbox + política de aprovação)';

  @override
  String get stateCommandPermissionHint => '<nome predefinido>';

  @override
  String get statePlanLabel => 'Plano';

  @override
  String get stateCommandPlanDescription => 'Digite ou deixe o modo Plan';

  @override
  String get stateGoalLabel => 'Objetivo';

  @override
  String get stateCommandGoalDescription => 'Definir ou visualizar o objetivo para uma tarefa de longo prazo';

  @override
  String get stateFeedbackLabel => 'Feedback';

  @override
  String get stateCommandFeedbackDescription => 'Enviar comentários sobre esta conversa';

  @override
  String get stateCommandFeedbackHint => '<mensagem>';

  @override
  String get stateShareFileTooLarge => 'Um arquivo era muito grande e não foi adicionado';

  @override
  String get stateShareFileUnreadable => 'Não foi possível ler um arquivo';

  @override
  String get stateShareImagesOnly => 'Esta máquina só pode enviar imagens';

  @override
  String get stateComposerInserted => 'Adicionado ao compositor';

  @override
  String get stateCordisPending => 'Pendente';

  @override
  String get stateCordisStarting => 'Iniciando';

  @override
  String get stateCordisRunFailed => 'A execução falhou';

  @override
  String get stateCordisNoApproval => 'A permissão de execução não foi concedida';

  @override
  String get stateCordisBackendFailed => 'Não foi possível iniciar o componente de fundo';

  @override
  String get stateCordisClientLoadFailed => 'Não foi possível carregar a interface';

  @override
  String get stateCordisRenderFailed => 'Não foi possível exibir a interface';

  @override
  String get stateCordisFailed => 'Não foi possível executar';

  @override
  String get stateDrawerAll => 'Tudo';

  @override
  String get stateDrawerUnread => 'Não- Lido';

  @override
  String get stateDrawerToday => 'Hoje';

  @override
  String get stateDrawerThisWeek => 'Esta semana';

  @override
  String get stateDrawerEarlier => 'Anteriormente';

  @override
  String get stateEngineAuthFailed => 'Falha na autenticação do motor';

  @override
  String get stateChatMissing => 'Esta conversa desapareceu.';

  @override
  String get stateEngineUnsupported => 'Não suportado por esta versão do motor';

  @override
  String get stateSettingsRefreshed => 'Mudou para outro lugar. Refrescado.';

  @override
  String get stateCredentialFromEnvironment => 'Esta chave vem do ambiente do motor e não pode ser alterado aqui';

  @override
  String get stateSettingsFromFile => 'Definir por arquivo de configuração';

  @override
  String get stateSettingsInteger => 'Digite um número inteiro';

  @override
  String get stateSettingsInvalidFormat => 'Formato inválido';

  @override
  String get stateSettingsReadOnly => 'As configurações do motor são somente leitura';

  @override
  String get statePluginDisabled => 'O plug-in está desativado';

  @override
  String get stateSettingsRestartRequired => 'Reiniciar o motor para alterar isto';

  @override
  String get stateSettingsInvalidValue => 'Valor inválido';

  @override
  String get stateSettingsRejected => 'O motor não aceitou este valor';

  @override
  String get stateInventoryEnabled => 'Activado';

  @override
  String get stateInventoryDisabled => 'Desactivado';

  @override
  String get stateLoading => 'Carregando';

  @override
  String get stateInventoryWaiting => 'À espera de dependências';

  @override
  String get stateInventoryConditional => 'Condicional';

  @override
  String get stateBundleBuiltIn => 'Construído em DSH';

  @override
  String get stateBundleHeadless => 'Sem cabeça';

  @override
  String get stateConfigFile => 'Arquivo de configuração';

  @override
  String get stateGoalEmpty => 'O objetivo não pode estar vazio';

  @override
  String get stateGoalPauseFailed => 'Não foi possível pausar';

  @override
  String get stateGoalResumeFailed => 'Não foi possível retomar';

  @override
  String get stateGoalClearOffline => 'Não foi possível limpar: Não pode alcançar o motor';

  @override
  String get stateGoalClearFailed => 'Não foi possível limpar';

  @override
  String get stateGoalStale => 'O objectivo mudou. Tente novamente.';

  @override
  String get stateGoalMissing => 'O objectivo foi-se.';

  @override
  String get stateGoalChatNotReady => 'O chat não está pronto. Tente novamente mais tarde.';

  @override
  String get stateGoalTurnsExhausted => 'Sem voltas à esquerda';

  @override
  String get stateGoalStateChanged => 'O status do objetivo foi alterado';

  @override
  String get stateSshHost => 'Máquina SSH';

  @override
  String get stateHostBrowserFailed =>
      'Não foi possível abrir o navegador. Copie o link de login e abra-o em um navegador.';

  @override
  String get stateSignInFailed => 'Não foi possível iniciar sessão';

  @override
  String get stateMarketTooLarge => 'Catálogo de plug-ins é muito grande. O download parou.';

  @override
  String get stateMarketUnreachable => 'Não é possível alcançar o catálogo de plugins';

  @override
  String get stateMarketInsecure => 'Não foi possível conectar com segurança ao catálogo de plugins';

  @override
  String get stateMarketTimeout => 'O catálogo de plug-ins foi cronometrado';

  @override
  String get stateMarketInterrupted => 'A transferência do catálogo de plug-ins foi interrompida';

  @override
  String get stateRegistryDefault => 'Registo por padrão';

  @override
  String get stateRegistryNpm => 'Registo oficial npm';

  @override
  String get stateRegistryMirror => 'espelho npmmirror';

  @override
  String get statePluginIncompatible => 'Este plugin não suporta a versão DSH atual.';

  @override
  String get statePluginInstallCancelled => 'Instalação cancelada';

  @override
  String get statePluginNoChanges => 'Nada mudou.';

  @override
  String get statePluginIncompatibleTitle => 'Incompatibilidade com este DSH';

  @override
  String get statePluginNetworkFailed => 'Não é possível conectar';

  @override
  String get statePluginSourceUnreachable => 'Não pode chegar ao site de origem do plugin';

  @override
  String get statePluginDownloadTimeout => 'Baixar cronometrado';

  @override
  String get statePluginRegistryUnavailable => 'Registro não está respondendo';

  @override
  String get statePluginPnpmMissing => 'Falta o pnpm';

  @override
  String get statePluginPhonePnpmMissing => 'Falta o pnpm neste celular';

  @override
  String get statePluginHostPnpmMissing => 'Falta o pnpm nesta máquina';

  @override
  String get statePluginNotFound => 'Plug- in não encontrado';

  @override
  String get statePluginPackageMissing => 'Pacote não encontrado no registro';

  @override
  String get statePluginTooNew => 'A versão é muito nova';

  @override
  String get statePluginWaitForRelease => 'Disponível para instalar 24 horas após o lançamento';

  @override
  String get statePluginVersionMissing => 'Versão não encontrada';

  @override
  String get statePluginRegistryVersionMissing => 'Esta versão ainda não está no registro';

  @override
  String get stateDeviceStorageFull => 'Não há armazenamento suficiente do dispositivo';

  @override
  String get statePluginNoWritePermission => 'Sem permissão de escrita';

  @override
  String get statePluginConfigReadOnly => 'O diretório de configuração do motor não é gravável';

  @override
  String get statePluginIntegrityFailed => 'A verificação do arquivo falhou';

  @override
  String get statePluginDownloadIncomplete => 'O arquivo registado está incompleto';

  @override
  String get statePluginBuildScripts => 'Compilar os programas necessários';

  @override
  String get statePluginBuildApproval => 'Os scripts de compilação precisam de aprovação';

  @override
  String get statePluginAlreadyInstalled => 'Já instalado';

  @override
  String get statePluginUninstallFirst => 'Desinstalar antes de mudar de versões';

  @override
  String get statePluginInvalid => 'Não é um plugin DSH';

  @override
  String get statePluginNoEntry => 'Este pacote não tem nenhum item de plugin. A instalação voltou.';

  @override
  String get statePluginInUse => '\'Plugin\' está em uso';

  @override
  String get statePluginHasDependents => 'Outros plugins dependem disso';

  @override
  String get statePluginManagedElsewhere => 'Não pode mudar isso aqui';

  @override
  String get statePluginEngineManaged => 'Este plugin é gerido pelo motor';

  @override
  String get statePluginAuthorizationExpired => 'Autorização expirada';

  @override
  String get statePluginBuildChanged => 'Os scripts de compilação foram alterados. Reinstalar o plugin.';

  @override
  String get statePluginInvalidAddress => 'URL de instalação inválido';

  @override
  String get statePluginCatalogInvalidAddress => 'O URL de instalação do catálogo é inválido';

  @override
  String get statePluginOperationIncomplete => 'A operação não terminou';

  @override
  String get statePluginRemoteForbidden => 'Esta máquina não permite a instalação remota';

  @override
  String get statePluginRelayToggleOnly => 'As conexões de retransmissão só podem ativar ou desativar plug-ins';

  @override
  String get statePluginManagementUnsupported => 'Host não suporta gerenciamento de plugin';

  @override
  String get statePluginEngineUnsupported => 'Este motor não suporta gerenciamento de plugin';

  @override
  String get statePluginResultMissing => 'Não foi possível obter o resultado da instalação';

  @override
  String get statePluginResultPending => 'Resultado da instalação pendente';

  @override
  String get statePluginDisconnected => 'Desligado';

  @override
  String get statePluginQueued => 'Em fila';

  @override
  String get statePluginRemoving => 'Desinstalar versão antiga';

  @override
  String get statePluginInstalling => 'Baixando e instalando';

  @override
  String get statePluginApplying => 'Habilitando';

  @override
  String get statePluginCancelling => 'Cancelar';

  @override
  String get statePluginInstalledRestart => 'Instalado. Recomeçar a aplicar.';

  @override
  String get statePluginInstallFailed => 'Não foi possível instalar';

  @override
  String get statePluginConnectFirst => 'Conectar para instalar plug-ins';

  @override
  String get stateProviderOpenAi => 'Compatível com OpenAI';

  @override
  String get stateProviderAnthropic => 'Compatibilidade antrópica';

  @override
  String get stateProviderUrlRequired => 'Digite um URL base';

  @override
  String get stateProviderUrlInvalid => 'Digite um URL completo começando com http:// ou https://';

  @override
  String get stateProviderUrlSuffix => 'Remova a parte depois? ou #';

  @override
  String get stateProviderKeyRequired => 'Digite uma chave de API';

  @override
  String get stateProviderKeyOnly => 'Colar apenas a chave, sem o nome da variável';

  @override
  String get stateProviderKeyQuotes => 'Remover as aspas circundantes';

  @override
  String get stateProviderKeyInvalid => 'Chave contém caracteres inválidos';

  @override
  String get stateProviderModelRequired => 'Digite um ID do modelo';

  @override
  String get stateProviderModelSpaces => 'O ID do modelo não pode conter espaços';

  @override
  String get stateProviderAlreadyAdded => 'Já adicionado';

  @override
  String get stateProviderConflict => 'O fornecedor mudou. Volta e tente novamente.';

  @override
  String get stateProviderUnsupported => 'Esta versão do motor não suporta esta ação';

  @override
  String get stateProviderKeyRejected => 'A chave API é inválida ou carece de permissão';

  @override
  String get stateProviderModelsMissing => 'A lista de modelos não foi encontrada. Verifique o URL da base.';

  @override
  String get stateProviderRateLimited => 'Muitos pedidos. Tente novamente mais tarde.';

  @override
  String get stateProviderResponseTooLarge => 'A resposta é demasiado grande';

  @override
  String get stateProviderUnreachable => 'Não é possível chegar a este endereço. Verifique o URL base e a rede.';

  @override
  String get stateProviderModelsUnreadable => 'Não foi possível ler a lista de modelos. Verifique o URL da base.';

  @override
  String get stateProviderManualModels => 'Este protocolo não pode listar modelos. Adicione-os manualmente.';

  @override
  String get stateProviderConfigRejected => 'O motor rejeitou esta configuração. Verifica o protocolo e o modelo.';

  @override
  String get stateProviderOffline => 'Não consegue alcançar o motor';

  @override
  String get stateSafeStartupFailed => 'Falha ao iniciar';

  @override
  String get stateSafeCrashedEarly => 'Caiu pouco depois de começar';

  @override
  String get stateSafeCrashedLate => 'Falhou durante a execução';

  @override
  String get stateSafeKilled => 'Parado pelo sistema';

  @override
  String get stateSafeManualEntry => 'Introduzi o modo seguro manualmente';

  @override
  String get stateScheduleNotCreated => 'O chat terminou sem criar a automação';

  @override
  String get stateScheduleChatFailed => 'Falha na conversa';

  @override
  String get stateScheduleResultPending => 'Ainda esperando por um resultado';

  @override
  String get statePlanPending => 'Revisão do plano';

  @override
  String get stateQuestionPending => 'Precisa de uma resposta';

  @override
  String get stateExportRelayUnsupported => 'Exportar ainda não está disponível sobre o Relay';

  @override
  String get stateExportChatMissing => 'Chat não encontrado';

  @override
  String get stateExportFailed => 'Não foi possível exportar';

  @override
  String get stateSizeExtraLarge => 'Extra grande';

  @override
  String get stateSubscriptionUnsupported => 'Este motor não suporta assinatura sign-in';

  @override
  String get stateSubscriptionUnreachable =>
      'Não é possível alcançar o serviço de login. Verifique sua rede e tente novamente.';

  @override
  String get stateSubscriptionSignInFailed => 'Não consegui terminar de assinar. Tente novamente.';

  @override
  String get stateSubscriptionTimeout => 'Pedido de tempo esgotado. Verifique sua rede e tente novamente.';

  @override
  String get stateSubscriptionDisconnected => 'Motor desligado. Tente novamente mais tarde.';

  @override
  String get stateTerminalLimit => 'Limite do terminal alcançado';

  @override
  String get stateTerminalStartFailed => 'Não foi possível iniciar o terminal';

  @override
  String get stateTileDuotone => 'Duotone';

  @override
  String get stateTileGeometric => 'Geométrico';

  @override
  String get stateTileGlassy => 'Vidro';

  @override
  String get stateUiNative => 'Nativo';

  @override
  String get stateDefaultWorkspace => 'Espaço de trabalho padrão';

  @override
  String stateDiagnosticsSaved(String where) {
    return 'Gravado em $where';
  }

  @override
  String get stateDownloadsPrefix => 'Transferências/';

  @override
  String stateSharePluginCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count plugins', one: '1 plugin');
    return '$_temp0';
  }

  @override
  String stateShareSkillCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count competências', one: '1 habilidade');
    return '$_temp0';
  }

  @override
  String stateShareSettingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count grupos de configurações',
      one: '1 grupo de configurações',
    );
    return '$_temp0';
  }

  @override
  String stateAlertCompletedReply(String reply) {
    return 'Concluído · $reply';
  }

  @override
  String stateAlertErrorDetail(String detail) {
    return 'Erro · $detail';
  }

  @override
  String stateAlertUseTool(String name) {
    return 'Ferramenta de uso $name';
  }

  @override
  String stateAlertApprovalAction(String action) {
    return 'Necessita de aprovação: $action';
  }

  @override
  String stateAlertApprovalReason(String action, String reason) {
    return 'Necessita de aprovação: $action · $reason';
  }

  @override
  String stateAlertQuestions(String question, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pergunta para si: $question ($count Total)',
      one: 'Pergunta para si: $question (1 total)',
    );
    return '$_temp0';
  }

  @override
  String stateAlertQuestionText(String question) {
    return 'Pergunta para si: $question';
  }

  @override
  String statePetChatsDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chats terminados',
      one: '1 chat terminado',
    );
    return '$_temp0';
  }

  @override
  String statePetChatsFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chats falhou',
      one: 'Falha na 1 conversação',
    );
    return '$_temp0';
  }

  @override
  String statePetChatsApproval(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chats precisam de aprovação',
      one: '1 chat precisa de aprovação',
    );
    return '$_temp0';
  }

  @override
  String statePetChatsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chats precisam da sua resposta',
      one: '1 chat precisa da sua resposta',
    );
    return '$_temp0';
  }

  @override
  String stateAttachmentEmpty(String name) {
    return '“$name” está vazio';
  }

  @override
  String stateAttachmentImageLimit(String name) {
    return 'Imagem “$name” superior a 20 MB';
  }

  @override
  String stateAttachmentFileLimit(String name) {
    return 'Arquivo “$name\"\" superior a 30 MB';
  }

  @override
  String stateBotFinished(String name) {
    return '$name terminou o trabalho';
  }

  @override
  String stateBotQuestion(String name, String text) {
    return '$name pergunta: $text';
  }

  @override
  String stateBotApproval(String name, String text) {
    return '$name Necessidades de aprovação: $text';
  }

  @override
  String get stateCommandPlanHint => '[off | request]';

  @override
  String get stateCommandGoalHint => '[goal | clear | pause | resume]';

  @override
  String stateShareReadFailed(String name) {
    return 'Não foi possível ler “$name”';
  }

  @override
  String stateShareAttachmentLimit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Até $count anexos por mensagem',
      one: 'Até 1 anexo por mensagem',
    );
    return '$_temp0';
  }

  @override
  String stateShareNamedFileTooLarge(String name) {
    return '“$name” é muito grande e não foi adicionado';
  }

  @override
  String stateShareTextTruncated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'O texto é muito longo. Mantido o primeiro $count personagens.',
      one: 'O texto é muito longo. Manteve o primeiro personagem.',
    );
    return '$_temp0';
  }

  @override
  String stateSettingsMinimum(String bound) {
    return 'Deve ser pelo menos $bound';
  }

  @override
  String stateSettingsMaximum(String bound) {
    return 'Deve ser no máximo $bound';
  }

  @override
  String stateSettingsMultiple(String bound) {
    return 'Deve ser um múltiplo de $bound';
  }

  @override
  String stateSettingsMinLength(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pelo menos $count caracteres',
      one: 'Pelo menos 1 caractere',
    );
    return '$_temp0';
  }

  @override
  String stateSettingsMaxLength(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'No máximo $count caracteres',
      one: 'No máximo 1 caracter',
    );
    return '$_temp0';
  }

  @override
  String stateEngineHttpRejected(int status) {
    return 'O motor rejeitou o pedido ($status)';
  }

  @override
  String stateGoalActionOffline(String action) {
    return '$action: Não pode alcançar o motor';
  }

  @override
  String stateHostRemoteLabel(String name) {
    return '$name · Remoto';
  }

  @override
  String stateMarketHttpError(int status) {
    return 'Não é possível abrir o catálogo de plugins (HTTP $status)';
  }

  @override
  String statePluginRuntimeIncompatible(String version) {
    return 'Este plugin não suporta a versão DSH atual ($version).';
  }

  @override
  String statePluginRequiredVersion(String wanted, String current) {
    return 'Este plugin requer DSH $wanted. Versão actual: $current.';
  }

  @override
  String get statePluginRegistryUnreachable => 'Não é possível chegar ao registro';

  @override
  String statePluginNamedRegistryUnreachable(String registry) {
    return 'Não é possível chegar ao registro ($registry)';
  }

  @override
  String statePluginBuildsPending(String builds) {
    return 'Necessita de aprovação: $builds';
  }

  @override
  String statePluginRegistryProgress(String registry, int attempt, int attempts) {
    return 'A obter de $registry (registo $attempt/$attempts)';
  }

  @override
  String stateProviderServiceUnavailable(int status) {
    return 'Serviço não disponível ($status)';
  }

  @override
  String stateProviderServiceStatus(int status) {
    return 'Serviço devolvido $status';
  }

  @override
  String stateProviderKeySaveFailed(String reason) {
    return 'O provedor salvou, mas a chave não foi: $reason';
  }

  @override
  String stateSafeSuspectPlugins(String what, String plugins) {
    return '$what, suspeita de plugins: $plugins';
  }

  @override
  String stateSafePreflightFailed(String what, String checks) {
    return '$what, as verificações de inicialização falharam: $checks';
  }

  @override
  String get stateListSeparator => ', ';

  @override
  String stateSafeRepairPrompt(String what) {
    return 'Meu DSH tem um problema no modo normal ($what). Siga as instruções do modo seguro para encontrar a causa. Corrija a configuração da web usando alterações reversíveis e verifique a inicialização com `dsh-app-plugins trial`. Depois, conte o que mudou.';
  }

  @override
  String stateScheduleCreatePrompt(String title, String rule, String args) {
    return 'Crie a automação “$title”: $rule.\nChame `schedule_create` exatamente uma vez, usando estes argumentos sem alterações. Não execute a tarefa agora.\n\n```json\n$args\n```';
  }

  @override
  String stateActionReason(String action, String reason) {
    return '$action: $reason';
  }

  @override
  String stateAlertPreviewRun(String value) {
    return 'Executar: $value';
  }

  @override
  String stateAlertPreviewWrite(String value) {
    return 'Escrever: $value';
  }

  @override
  String stateAlertPreviewEdit(String value) {
    return 'Editar: $value';
  }

  @override
  String stateAlertPreviewOpen(String value) {
    return 'Abrir: $value';
  }

  @override
  String stateAlertPreviewUse(String value) {
    return 'Ferramenta de uso: $value';
  }

  @override
  String get stateUiWeb => 'Web';

  @override
  String statePluginRegistryProgressUnknown(String registry, int attempt) {
    return 'A obter de $registry (registo $attempt/null)';
  }

  @override
  String get stateProviderTokenCountInvalid => 'Digite um número, como 128K';

  @override
  String get appSlogan => 'A qualquer hora, em qualquer lugar. É só começar!';

  @override
  String get updateCheck => 'Verificar as actualizações';

  @override
  String get updateAutoCheck => 'Verificar automaticamente';

  @override
  String get updateAutoCheckDaily => 'Uma vez por dia';

  @override
  String get updateTileDownloading => 'Baixando';

  @override
  String updateTileDownloadingPercent(int percent) {
    return 'Baixando $percent%';
  }

  @override
  String get updateTileVerifying => 'Verificando';

  @override
  String get updateTileReady => 'Pronto para instalar';

  @override
  String get updateTileInstalling => 'Instalar';

  @override
  String updateTileSkipped(String version) {
    return 'Saltado $version';
  }

  @override
  String updateTileNewVersion(String version) {
    return 'Novo: $version';
  }

  @override
  String get updateTileUpToDate => 'Actualizado';

  @override
  String get updateTileUnavailable => 'Não é possível verificar agora';

  @override
  String get updateUpToDate => 'Você está atualizado';

  @override
  String get updateCheckUnavailable => 'Não é possível verificar as atualizações agora. Tente novamente mais tarde.';

  @override
  String get updateDownloadInterrupted => 'Transferência interrompida';

  @override
  String get updateDownloadInterruptedMessage => 'A rede está desligada ou muito lenta. Tente retomar.';

  @override
  String get updateDownloadUnavailable => 'Download link indisponível';

  @override
  String get updateDownloadUnavailableMessage =>
      'Tente novamente mais tarde, ou baixe a partir da página de lançamento.';

  @override
  String get updateChecksumFailed => 'A verificação do pacote falhou';

  @override
  String get updateChecksumFailedMessage => 'O arquivo não corresponde à versão e foi excluído. Tente novamente.';

  @override
  String get updateChecksumMissing => 'Faltam informações de verificação';

  @override
  String get updateChecksumMissingMessage => 'Para segurança, baixe da página de lançamento para instalar.';

  @override
  String get updateStorageWriteFailed => 'Não foi possível salvar o pacote';

  @override
  String get updateStorageWriteFailedMessage => 'O armazenamento pode estar cheio. Liberte espaço e tente novamente.';

  @override
  String get updateFreeSpaceRetry => 'Liberte espaço e tente novamente.';

  @override
  String updateSpaceRequired(String size) {
    return 'Sobre $size de espaço livre necessário. Liberte espaço e tente novamente.';
  }

  @override
  String get updateSettingsOpenFailed => 'Não foi possível abrir as configurações do sistema';

  @override
  String get updateSettingsOpenFailedMessage =>
      'Permitir \"Instalar aplicativos desconhecidos\" em Configurações → Apps → DSH Go, em seguida, voltar a instalar.';

  @override
  String get updateInstallCancelled => 'Instalação cancelada';

  @override
  String get updateInstallCancelledMessage => 'O pacote está salvo. Você pode instalá-lo a qualquer momento.';

  @override
  String get updateSignatureMismatch => 'As assinaturas do aplicativo não correspondem';

  @override
  String get updateSignatureMismatchMessage =>
      'O DSH Go para o seu telefone tem uma assinatura diferente (geralmente uma compilação de testes). Desinstale-o antes de instalar esta versão. Desinstalar apaga seus chats, ambiente Linux e configurações.';

  @override
  String get updateWrongPackage => 'Este não é um pacote DSH';

  @override
  String get updateWrongPackageMessage => 'O arquivo errado foi baixado e excluído. Tente novamente mais tarde.';

  @override
  String get updateDowngradeBlocked => 'Não é possível instalar uma versão mais antiga';

  @override
  String get updateDowngradeBlockedMessage => 'O DSH no seu telefone é mais novo do que este pacote.';

  @override
  String get updateIncompatible => 'Incompatibilidade com este celular';

  @override
  String get updateIncompatibleMessage =>
      'A versão ou arquitetura do processador Android necessária do pacote não corresponde ao seu telefone.';

  @override
  String get updatePackageCorrupt => 'O pacote está danificado';

  @override
  String get updatePackageCorruptMessage => 'Foi apagado. Baixe-o novamente.';

  @override
  String get updateInstallBlocked => 'Instalação bloqueada';

  @override
  String get updateInstallBlockedMessage =>
      'Permitir a instalação no prompt do sistema, ou baixar a partir da página de lançamento.';

  @override
  String get updateInstallIncomplete => 'Instalação incompleta';

  @override
  String get updateInstallIncompleteMessage => 'Tente novamente, ou baixe a partir da página de lançamento.';

  @override
  String updateBrowserOpenFailed(String host, String path) {
    return 'Não foi possível abrir o seu navegador. Visita $host$path manualmente.';
  }

  @override
  String updateUpToDateVersion(String version) {
    return 'Você está atualizado: $version';
  }

  @override
  String updateCurrentVersion(String version) {
    return 'Atual $version';
  }

  @override
  String get updateNewVersionFound => 'Nova versão disponível';

  @override
  String get updateReleaseNotes => 'Novidades';

  @override
  String get updateNoReleaseNotes => 'Nenhuma nota de lançamento para esta versão.';

  @override
  String get updateInstallKeepsData => 'DSH Go fechar para instalar. Suas conversas e configurações ficam.';

  @override
  String get updateNoCompatiblePackage => 'Nenhum pacote para este celular';

  @override
  String get updateDownloading => 'Baixando';

  @override
  String updateDownloadSource(String source) {
    return 'Via $source';
  }

  @override
  String get updateDownloadInBackgroundNote => 'A transferência continua depois de fechar esta janela';

  @override
  String get updateVerifyingPackage => 'Verificando o pacote...';

  @override
  String get updateVerifyingPackageNote => 'Verificar se o arquivo corresponde à versão';

  @override
  String get updateInstalling => 'Instalando...';

  @override
  String get updateConfirmInstallNote => 'Confirmar a instalação no prompt do sistema';

  @override
  String get updatePackageDownloaded => 'Pacote baixado';

  @override
  String get updateReadyToInstall => 'Verificado e pronto para instalar.';

  @override
  String get updateAllowInstall => 'Permitir DSH Go para instalar aplicativos';

  @override
  String get updateAllowInstallMessage =>
      'Ligue “Instalar aplicativos desconhecidos” nas configurações do sistema. A instalação continua quando você retorna.';

  @override
  String get updateOpenReleasePage => 'Abrir página de lançamento';

  @override
  String get updateUpdateNow => 'Atualizar agora';

  @override
  String get updateSkipVersion => 'Ignorar esta versão';

  @override
  String get updateStarProject => 'Estrelar';

  @override
  String get updateCancelDownload => 'Cancelar a transferência';

  @override
  String get updateDownloadInBackground => 'Baixar em segundo plano';

  @override
  String get updateVerifying => 'Verificando...';

  @override
  String get updateInstallingBusy => 'Instalando...';

  @override
  String get updateOpenPermissionSettings => 'Ligar';

  @override
  String updateNoAbiPackage(String abi) {
    return 'Não $abi pacote para esta versão ainda. Verifique a página de lançamento.';
  }

  @override
  String get updateNoPackage => 'Nenhum pacote para este lançamento ainda. Verifique a página de lançamento.';

  @override
  String updateDownloadingPercent(int percent) {
    return 'Baixando $percent%';
  }

  @override
  String get usageStatsTitle => 'Enviar estatísticas anônimas de uso';

  @override
  String get usageStatsSection => 'Melhorar o DSH Go';

  @override
  String get usageStatsFooter =>
      'Apenas contagens de uso, versões e fabricante do celular. Nunca conversas, arquivos ou contas.';

  @override
  String get usageNoticeBody => 'Sem conversas nem informações pessoais.\nDesative quando quiser.';

  @override
  String get usageUpgradeNotice =>
      'Novidade: estatísticas anônimas de uso para melhorar o DSH Go.\nSem conversas nem informações pessoais.';

  @override
  String get usageUpgradeLearn => 'Saiba mais';

  @override
  String get usageUpgradeOff => 'Desativar';

  @override
  String viewArtifactSaved(String value) {
    return 'Gravado em $value';
  }

  @override
  String get viewDownloadFolder => 'Transferências/';

  @override
  String get viewArtifactNoPreview => 'Não é possível visualizar';

  @override
  String get viewArtifactNotText => 'Nenhum arquivo de texto';

  @override
  String get viewArtifactLarge => 'Arquivo grande';

  @override
  String get viewArtifactMissing => 'Este arquivo já não está disponível';

  @override
  String get viewArtifactNotFile => 'Este não é um arquivo';

  @override
  String get viewArtifactOpenFailed => 'Não foi possível abrir';

  @override
  String get viewArtifactMore => 'Mais ações';

  @override
  String get viewWorkspace => 'Espaço de trabalho';

  @override
  String get viewArtifactEmpty => 'Arquivo vazio';

  @override
  String viewArtifactLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count linhas', one: '1 linha');
    return 'Um arquivo grande. Mostrando o primeiro $_temp0';
  }

  @override
  String viewArtifactRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count linhas', one: '1 linha');
    return 'Mostrando o primeiro $_temp0';
  }

  @override
  String get viewArtifactColumns => 'Mostrando as primeiras 200 colunas';

  @override
  String viewArtifactWorksheet(int value) {
    return 'Folha $value';
  }

  @override
  String get viewArtifactEmptySheet => 'Folha vazia';

  @override
  String get viewArtifactEmptyTable => 'Mesa vazia';

  @override
  String get viewArtifactConvertFailed => 'Não foi possível converter';

  @override
  String get viewArtifactConverting => 'A converter para PDF...';

  @override
  String get viewArtifactImageFailed => 'Não é possível exibir esta imagem';

  @override
  String get viewArtifactPhoneOpen => 'Abrir num aplicativo neste celular';

  @override
  String get viewArtifactPdfFailed => 'Não é possível abrir este PDF. Tente outra aplicativo.';

  @override
  String viewArtifactPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count páginas', one: '1 página');
    return '$_temp0';
  }

  @override
  String viewArtifactPage(int value) {
    return 'Página $value';
  }

  @override
  String get viewBalanceInvalidKey => 'Chave inválida. Não é possível verificar o equilíbrio.';

  @override
  String get viewBalancePrefix => 'Saldo ';

  @override
  String get viewBalanceLowSuffix => ' · Baixo equilíbrio';

  @override
  String get viewBalanceUnavailableSuffix => ' · Chamadas indisponível';

  @override
  String get viewBalanceTopUp => 'Completar';

  @override
  String get viewBalanceTitle => 'DeepSeek balance';

  @override
  String get viewBalanceKeyRequired => 'Digite uma chave de API para verificar seu saldo';

  @override
  String get viewBalanceKeyInvalid => 'Chave API inválida. Não é possível verificar o equilíbrio.';

  @override
  String viewBalancePaid(String value) {
    return 'Pago $value';
  }

  @override
  String viewBalanceGranted(String value) {
    return 'Bônus $value';
  }

  @override
  String get viewBalanceLow => 'Baixo equilíbrio';

  @override
  String get viewBalanceUnavailable => 'Chamadas indisponível';

  @override
  String get viewBalanceChecking => 'A verificar o equilíbrio...';

  @override
  String get viewBalanceCheckFailed => 'Não é possível verificar o equilíbrio agora';

  @override
  String get viewBalanceNoAlert => 'Desligado';

  @override
  String viewBalanceBelow(String value) {
    return 'Abaixo $value';
  }

  @override
  String get viewBalanceAlert => 'Alerta de equilíbrio baixo';

  @override
  String get viewBalanceThreshold => 'Limiar de alerta';

  @override
  String get viewBalanceGoTopUp => 'Completar';

  @override
  String viewBalanceRemaining(String value) {
    return 'Apenas $value esquerda';
  }

  @override
  String get viewBalanceModelDisabled => 'Equilíbrio insuficiente. Modelo desativado.';

  @override
  String get viewBalanceRestore => 'Completar para retomar';

  @override
  String get viewUiIncomplete => 'A vista ainda está a gerar';

  @override
  String get viewUiInvalid => 'Esta vista tem um erro de formatação';

  @override
  String get viewUiResend => 'Pedir para reenviar';

  @override
  String viewChartUnit(String value) {
    return 'Unidade: $value';
  }

  @override
  String viewChartSeries(int value) {
    return 'Série $value';
  }

  @override
  String get viewChartTotal => 'Total';

  @override
  String get viewChartBar => 'Gráfico de barras';

  @override
  String get viewChartHorizontalBar => 'Gráfico de barras horizontal';

  @override
  String get viewChartLine => 'Gráfico de linhas';

  @override
  String get viewChartDonut => 'Gráfico de Donuts';

  @override
  String viewUiResendMessage(Object value) {
    return 'Não foi possível mostrar a vista anterior do dsh-ui: ${value}Consertar e reenviar.';
  }

  @override
  String viewUiBytesLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first bytes', one: 'segundo byte');
    String _temp1 = intl.Intl.pluralLogic(second, locale: localeName, other: '$second bytes', one: 'segundo byte');
    return 'Ver é $_temp0, excedendo o limite de $_temp1';
  }

  @override
  String get viewUiEmptyCode => 'O bloco de código está vazio';

  @override
  String viewUiInvalidJson(String message) {
    return 'JSON inválido ($message)';
  }

  @override
  String get viewUiJsonRepaired => 'Comentários ou vírgulas finais ignoradas';

  @override
  String get viewUiExpectedObject => 'Esperava um objeto componente';

  @override
  String viewUiDepthLimit(int first, int second) {
    return 'Profundidade $first ultrapassa o limite de $second';
  }

  @override
  String get viewUiMissingType => 'Tipo em falta';

  @override
  String viewUiUnknownComponent(String value) {
    return 'Componente desconhecido $value';
  }

  @override
  String viewUiAvailableTypes(String first, String second) {
    return '$first; disponível: $second';
  }

  @override
  String viewUiExpectedChildren(int limit) {
    return 'Espera-se uma matriz de 1 para $limit componentes';
  }

  @override
  String viewUiHiddenItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mais itens escondidos',
      one: 'Mais 1 item escondido',
    );
    return 'Truncado: $_temp0';
  }

  @override
  String viewUiNodeLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first componentes',
      one: 'segundo componente',
    );
    String _temp1 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$second itens truncados',
      one: 'Segundo item truncado',
    );
    return 'Superior a 6 % $_temp0; último $_temp1';
  }

  @override
  String viewUiChildLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first itens', one: 'segunda rubrica');
    String _temp1 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$second itens truncados',
      one: 'Segundo item truncado',
    );
    return 'Superior a 6 % $_temp0; último $_temp1';
  }

  @override
  String get viewUiExpectedString => 'Esperava um texto';

  @override
  String viewUiTextLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first caracteres',
      one: 'segundo caracter',
    );
    return '$_temp0, excedendo o limite de $second';
  }

  @override
  String get viewUiTextTruncated => 'Truncado: texto demasiado longo';

  @override
  String get viewUiExpectedFinite => 'Esperava um número finito';

  @override
  String get viewUiYes => 'Sim.';

  @override
  String get viewUiNo => 'Não';

  @override
  String get viewUiExpectedStringNumber => 'Esperava um texto ou número';

  @override
  String viewUiUnknownTone(String value) {
    return 'Tom desconhecido $value, ignorado; disponível: bom, alerta, mau';
  }

  @override
  String viewUiUnknownChart(String value) {
    return 'Gráfico desconhecido $value, desenhado como barras; disponível: bar, hbar, linha, donut';
  }

  @override
  String get viewUiExpectedCategories => 'Esperava um array não vazio de rótulos';

  @override
  String viewUiCategoryLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first categorias',
      one: 'segunda categoria',
    );
    return '$_temp0, excedendo o limite de $second';
  }

  @override
  String viewUiFirstPoints(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit pontos', one: '1 ponto');
    return 'Mostrando apenas o primeiro $_temp0';
  }

  @override
  String viewUiExpectedSeries(String shape) {
    return 'Esperava- se uma matriz não vazia de $shape objetos';
  }

  @override
  String get viewUiSkippedSeries => 'Espera- se um array de números; a série foi ignorada';

  @override
  String viewUiValuesCategories(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first valores', one: 'segundo valor');
    String _temp1 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$second categorias',
      one: 'segunda categoria',
    );
    return '$_temp0 em vez $_temp1; valores extras caídos, valores em falta deixados em branco';
  }

  @override
  String viewUiNonFiniteValues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valores não-finitos',
      one: '1 valor não-finito',
    );
    return '$_temp0 deixado em branco';
  }

  @override
  String get viewUiNoSeries => 'Nenhuma série a desenhar';

  @override
  String viewUiDonutSeries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count outras séries ignoradas',
      one: '1 outras séries ignoradas',
    );
    return 'Gráfico de Donuts usa uma série; $_temp0';
  }

  @override
  String get viewUiFirstSeries => 'Desenhando apenas a primeira série';

  @override
  String viewUiSeriesLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first série', one: 'segunda série');
    return '$_temp0, excedendo o limite de $second';
  }

  @override
  String viewUiFirstSeriesCount(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit série', one: 'Série 1');
    return 'Mostrando apenas o primeiro $_temp0';
  }

  @override
  String get viewUiNoFiniteValues => 'Sem valores finitos';

  @override
  String viewUiTruncated(String value) {
    return 'Truncado: $value';
  }

  @override
  String viewUiExpectedCompare(int limit, String shape) {
    return 'Espera-se um array de 2 para $limit $shape objetos';
  }

  @override
  String viewUiItemLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first itens', one: 'segunda rubrica');
    return '$_temp0, excedendo o limite de $second';
  }

  @override
  String viewUiFirstItems(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit itens', one: '1 ponto');
    return 'Mostrando apenas o primeiro $_temp0';
  }

  @override
  String viewUiSkippedCompare(String shape) {
    return 'Esperado $shape; item ignorado';
  }

  @override
  String get viewUiSkippedItemLabel => 'Espera- se um texto não vazio; item ignorado';

  @override
  String viewUiRowLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first linhas', one: 'segunda linha');
    return '$_temp0, excedendo o limite de $second';
  }

  @override
  String get viewUiSkippedRow => 'Esperado [nome, valor]; linha ignorada';

  @override
  String get viewUiNoItems => 'Sem itens a desenhar';

  @override
  String viewUiFirstRows(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit linhas', one: '1 linha');
    return 'Mostrando apenas o primeiro $_temp0 por item';
  }

  @override
  String viewUiExpectedSteps(String shape) {
    return 'Esperava- se uma matriz não vazia de $shape objetos';
  }

  @override
  String viewUiStepLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first passos', one: 'segunda etapa');
    return '$_temp0, excedendo o limite de $second';
  }

  @override
  String viewUiFirstSteps(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit passos', one: '1 etapa');
    return 'Truncado: mostrando apenas o primeiro $_temp0';
  }

  @override
  String viewUiSkippedStep(String shape) {
    return 'Esperado $shape; passo ignorado';
  }

  @override
  String viewUiUnknownStatus(String value) {
    return 'Estado desconhecido $value, desenhado como item a fazer; disponível: feito, atual, tarefa, falhou';
  }

  @override
  String get viewUiNoSteps => 'Sem passos a desenhar';

  @override
  String viewUiUnknownCalloutTone(String value) {
    return 'Tom desconhecido $value, desenhado como informação; disponível: informação, bom, alerta, mau';
  }

  @override
  String viewUiExpectedOptions(int limit, String shape) {
    return 'Espera-se uma matriz de 1 para $limit $shape opções';
  }

  @override
  String viewUiOptionLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first opções', one: 'segunda opção');
    return '$_temp0, excedendo o limite de $second';
  }

  @override
  String viewUiFirstOptions(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit opções', one: '1 opção');
    return 'Truncado: mostrando apenas o primeiro $_temp0';
  }

  @override
  String viewUiDuplicateLabel(String value) {
    return 'Duplicar a legenda $value; ignorado';
  }

  @override
  String get viewUiNoOptions => 'Sem opções utilizáveis';

  @override
  String viewUiSummaryBody(String value) {
    return '[Ver] $value';
  }

  @override
  String viewUiSummaryTitleBody(String first, String second) {
    return '[Ver] $first: $second';
  }

  @override
  String get viewUiSummaryInvalid => '[Ver] (erro de formatação, não foi possível exibir)';

  @override
  String viewUiSummaryText(String value) {
    return 'Texto: $value';
  }

  @override
  String viewUiSummaryChart(String summary) {
    return 'Gráfico: $summary';
  }

  @override
  String viewUiSummaryCompare(String value) {
    return 'Comparar: $value';
  }

  @override
  String viewUiSummarySteps(String value) {
    return 'Passos: $value';
  }

  @override
  String viewUiSummaryCallout(String value) {
    return 'Nota: $value';
  }

  @override
  String viewUiSummaryOptions(String value) {
    return 'Opções: $value';
  }

  @override
  String viewUiSummaryConfirm(String first, String second) {
    return 'Confirmar: $first/$second';
  }

  @override
  String viewUiReplyChoice(String value) {
    return 'Selecionar: $value';
  }

  @override
  String viewUiReplyConfirm(String value) {
    return 'Confirmar: $value';
  }

  @override
  String viewUiReplyCancel(String value) {
    return 'Cancelar: $value';
  }

  @override
  String viewUiChosen(String value) {
    return 'Seleccionado: $value';
  }

  @override
  String get viewUiConfirmed => 'Confirmado';

  @override
  String viewUiConfirmedValue(String value) {
    return 'Confirmado: $value';
  }

  @override
  String viewUiCancelledValue(String value) {
    return 'Cancelado: $value';
  }

  @override
  String get viewUiReplied => 'Replicado';

  @override
  String get viewUiGenerating => 'Gerando visão';

  @override
  String get viewUiReplyAfterEnd => 'Escolha quando a resposta está completa';

  @override
  String get viewUiExpired => 'Expirado';

  @override
  String get viewUiNotStarted => 'Não iniciado';

  @override
  String get viewUiMultiple => 'Selecionar múltiplos';

  @override
  String get viewSuggestWorkspace => 'Explore o espaço de trabalho';

  @override
  String get viewSuggestWorkspacePrompt =>
      'Verifique quais arquivos e projetos estão na área de trabalho e me dê uma breve visão geral.';

  @override
  String get viewSuggestWordCount => 'Contar palavras';

  @override
  String get viewSuggestWordCountPrompt =>
      'Escreva um script Python que encontre as 20 palavras mais frequentes em um arquivo de texto, então execute-o e me mostre os resultados.';

  @override
  String get viewSuggestNode => 'Iniciar o Node.js';

  @override
  String get viewSuggestNodePrompt =>
      'Crie um projeto Node.js na área de trabalho com TypeScript e um teste unitário mínimo.';

  @override
  String get viewSuggestGit => 'Fazer rebase ou mesclagem';

  @override
  String get viewSuggestGitPrompt =>
      'Use um exemplo concreto para explicar a diferença entre git rebase e git merge, e quando usar cada um.';

  @override
  String get viewGreetingMorning => 'Bom dia.';

  @override
  String get viewGreetingNoon => 'Boa tarde.';

  @override
  String get viewGreetingAfternoon => 'Boa tarde.';

  @override
  String get viewGreetingEvening => 'Boa noite.';

  @override
  String get viewGreetingNight => 'É tarde';

  @override
  String get viewEmptySubtitle => 'O que gostaria de fazer hoje?';

  @override
  String get viewEmptyStarting => 'Iniciando o mecanismo…';

  @override
  String get viewEmptyConnecting => 'Ligando ao motor...';

  @override
  String get viewEmptyDisconnected => 'Motor não ligado';

  @override
  String get viewEmptyReconnect => 'Religar';

  @override
  String viewEmptyWorkspace(String value) {
    return 'Em “$value”';
  }

  @override
  String get viewEmptySwitchWorkspace => 'Mudar de espaço de trabalho';

  @override
  String get viewScheduleTitle => 'Automação';

  @override
  String get viewScheduleRefreshFailed => 'Não foi possível atualizar';

  @override
  String get viewScheduleNone => 'Sem automação ativa';

  @override
  String viewScheduleNext(String value) {
    return 'Próxima $value';
  }

  @override
  String get viewScheduleUntitled => 'Automação sem título';

  @override
  String get viewScheduleSendFailed => 'Não foi possível enviar';

  @override
  String get viewScheduleEnded => 'Terminado';

  @override
  String get viewScheduleUpcoming => 'Próxima';

  @override
  String get viewScheduleSending => 'Enviando...';

  @override
  String get viewScheduleRunNow => 'Corre agora.';

  @override
  String get viewScheduleManage => 'Gerenciar';

  @override
  String viewScheduleToday(String value) {
    return 'Hoje $value';
  }

  @override
  String viewScheduleTomorrow(String value) {
    return 'Amanhã. $value';
  }

  @override
  String viewScheduleYesterday(String value) {
    return 'Ontem $value';
  }

  @override
  String viewScheduleWeekday(String first, String second) {
    return '$first $second';
  }

  @override
  String get viewScheduleDue => 'Deve-se agora.';

  @override
  String viewScheduleDaysAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count dias', one: '1 dia');
    return 'In $_temp0';
  }

  @override
  String viewScheduleDaysOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count dias', one: '1 dia');
    return '$_temp0 atraso';
  }

  @override
  String viewScheduleSingleLabel(String title) {
    return 'Automação: $title';
  }

  @override
  String viewScheduleCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count automação', one: '1 automação');
    return '$_temp0';
  }

  @override
  String get viewModelSelect => 'Escolher modelo';

  @override
  String get viewModelThinkingOff => 'Desligado';

  @override
  String get viewModelThinkingMinimal => 'Mínimo';

  @override
  String get viewModelThinkingLow => 'Baixo';

  @override
  String get viewModelThinkingMedium => 'Médio';

  @override
  String get viewModelThinkingHigh => 'Alta';

  @override
  String get viewModelThinkingMax => 'Máxima';

  @override
  String viewModelLabel(String value) {
    return 'Modelo: $value';
  }

  @override
  String viewModelEffortLabel(String value) {
    return 'Esforço de pensamento $value';
  }

  @override
  String get viewModelLoadFailed => 'Não foi possível carregar modelos';

  @override
  String get viewModelDisconnected => 'Motor não ligado';

  @override
  String get viewModelConnectHint => 'Conecte-se para escolher um modelo';

  @override
  String get viewModelEffort => 'Esforço de pensamento';

  @override
  String get viewModelKeyRequired => 'Chave API necessária';

  @override
  String get viewModelProvidersHint => 'Suporta DeepSeek e outros fornecedores de modelos';

  @override
  String get viewModelEnterKey => 'Digite a chave de API';

  @override
  String get viewModelAddProvider => 'Adicionar provedor';

  @override
  String get viewModelNone => 'Nenhum modelo disponível';

  @override
  String get viewModelKeyHint => 'A chave pode não estar ativa ou ter expirado';

  @override
  String get viewModelManageProviders => 'Gerenciar provedores';

  @override
  String get viewContinuePrompt => 'Continuar a conversa anexada aqui:';

  @override
  String viewContinueRange(int first, int second, int third) {
    String _temp0 = intl.Intl.pluralLogic(third, locale: localeName, other: '$third voltas', one: '1 rodada');
    return 'Turnos $first–$second de $_temp0';
  }

  @override
  String viewContinueHeader(String value) {
    return '> DSH compartilhado Ir conversar · $value\n';
  }

  @override
  String get viewContinueUser => '\n# # Usuário\n\n';

  @override
  String viewImageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count imagens', one: '1 imagem');
    return '$_temp0';
  }

  @override
  String viewContinueAttachments(String value) {
    return '\n(Alterações: $value)\n';
  }

  @override
  String get viewContinueAssistant => '\n# # Assistente\n\n';

  @override
  String get viewContinueInterrupted => '\n(Resposta interrompida)\n';

  @override
  String get viewContinueFailed => '(Falhou)';

  @override
  String get viewContinueDeclined => '(Declinado)';

  @override
  String get viewContinueCancelled => '(Cancelled)';

  @override
  String get viewLinkWeek => '7 dias';

  @override
  String get viewLinkMonth => '30 dias';

  @override
  String get viewLinkForever => 'Para sempre.';

  @override
  String get viewShareChat => 'Conversar';

  @override
  String get viewShareNoPermission => 'Sem permissão de armazenamento. Não foi possível salvar.';

  @override
  String get viewShareOpenFailed => 'Não foi possível abrir a folha de compartilhamento';

  @override
  String get viewShareLinkFailed => 'Não foi possível criar o link. Tente novamente mais tarde.';

  @override
  String viewShareLinkText(String first, String second) {
    return '“$first” · DSH Go conversar\n$second';
  }

  @override
  String get viewShareEmpty => 'Este chat ainda não tem conteúdo';

  @override
  String viewShareMessageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count mensagens', one: '1 mensagem');
    return '$_temp0';
  }

  @override
  String viewShareToolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chamadas de ferramentas',
      one: '1 chamada de ferramenta',
    );
    return '$_temp0';
  }

  @override
  String get viewShareFileHint => 'Repetir e continuar no DSH Go';

  @override
  String get viewShareWebHint => 'Abre em qualquer navegador, mesmo offline';

  @override
  String get viewShareMarkdownHint => 'Texto simples, legível em qualquer lugar';

  @override
  String get viewShareLinkHint => 'De ponta a ponta criptografada. O servidor não consegue ver o seu conteúdo.';

  @override
  String get viewSharePreview => 'Antevisão';

  @override
  String get viewShareWhole => 'Conversa inteira';

  @override
  String get viewShareScopeReply => 'Esta resposta';

  @override
  String get viewShareScopePicked => 'Seleccionado';

  @override
  String get viewShareThinking => 'Pensar';

  @override
  String get viewShareIncludeTools => 'Chamadas de ferramentas';

  @override
  String get viewShareChatFile => 'Arquivo de chat';

  @override
  String get viewShareWebPage => 'Página Web';

  @override
  String get viewShareLink => 'Ligação';

  @override
  String get viewShareAsImage => 'Imagem';

  @override
  String get viewShareAsFile => 'Arquivo';

  @override
  String get viewShareAsText => 'Texto';

  @override
  String get viewShareRedacted => 'Segredos escondidos';

  @override
  String get viewShareAdjust => 'Editar';

  @override
  String viewShareTooLarge(int value) {
    return 'Terminado $value MB. Selecione menos mensagens.';
  }

  @override
  String get viewShareCreateLink => 'Criar um link';

  @override
  String get viewShareStop => 'Parar a compartilhamento';

  @override
  String get viewShareStopTitle => 'Parar de compartilhar?';

  @override
  String get viewShareStopped => 'A compartilhamento parou';

  @override
  String get viewQrCode => 'Código QR';

  @override
  String viewShareTurn(int value) {
    return 'Virar $value';
  }

  @override
  String get viewReplayContinue => 'Continuar a conversa';

  @override
  String viewReplayTurns(int first, int second) {
    return 'Turnos $first–$second';
  }

  @override
  String viewReplaySeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count seg', one: '1 segundo');
    return '$_temp0';
  }

  @override
  String viewReplayMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min', one: '1 min');
    return '$_temp0';
  }

  @override
  String get viewReplayFull => 'Conversa completo';

  @override
  String get viewReplayPause => 'Pausa';

  @override
  String get viewReplayRestart => 'Repetir';

  @override
  String get viewReplayPlay => 'Reproduzir';

  @override
  String viewReplaySpeed(int value) {
    return 'Velocidade $value×';
  }

  @override
  String get viewTemplatePaper => 'Papel';

  @override
  String get viewTemplateGlass => 'Vidro';

  @override
  String get viewTemplateCard => 'Cartão';

  @override
  String get viewShareProjectQr => 'Código QR do projeto';

  @override
  String get viewShareBrandLine => 'DSH no seu telefone · Examine para obtê-lo';

  @override
  String get viewShareBrandLineNoQr => 'DSH no seu telefone';

  @override
  String viewShareSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count passos', one: '1 etapa');
    return '$_temp0';
  }

  @override
  String get viewShareWebSearch => 'Pesquisa Web';

  @override
  String get viewShareOpenPage => 'Abrir página web';

  @override
  String get viewShareRunCommand => 'Executar o comando';

  @override
  String get viewShareReadFile => 'Ver arquivo';

  @override
  String get viewShareEditFile => 'Editar arquivo';

  @override
  String get viewShareSubagent => 'Subagente';

  @override
  String get viewShareSkill => 'Usar habilidade';

  @override
  String get viewSharePresentFiles => 'Apresentar arquivos';

  @override
  String get viewShareWorkflow => 'Fluxo de trabalho';

  @override
  String get viewSharePlugin => 'Plug- in de chamada';

  @override
  String get viewShareStars => 'Estrelas';

  @override
  String viewSharePluginTitle(String value) {
    return 'Plug- in DSH “$value”';
  }

  @override
  String viewShareInstallCommand(String value) {
    return 'Instalar: dsh plugin add $value';
  }

  @override
  String viewSharePhoneInstall(String value) {
    return 'Instale no seu telefone: $value';
  }

  @override
  String get viewShareImages => 'Imagens';

  @override
  String get viewSharePickMessages => 'Selecionar mensagens';

  @override
  String viewShareDoneCount(int count) {
    return 'Feito ($count)';
  }

  @override
  String get viewShareImageMarker => '[Imagem]';

  @override
  String viewShareImagesMarker(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count imagens', one: '1 imagem');
    return '[$_temp0]';
  }

  @override
  String get viewShareYou => 'Você';

  @override
  String get viewShareImageFailed => 'Não foi possível criar imagem. Tente novamente.';

  @override
  String get viewShareQuestion => 'Pergunta';

  @override
  String get viewShareModelSteps => 'Modelo e etapas';

  @override
  String get viewShareImagePreview => 'Compartilhar a antevisão da imagem';

  @override
  String get viewShareSaveImage => 'Gravar a imagem';

  @override
  String viewScheduleHoursAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count h', one: '1 h');
    return 'In $_temp0';
  }

  @override
  String viewScheduleHoursOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count h', one: '1 h');
    return '$_temp0 atraso';
  }

  @override
  String viewScheduleMinutesAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min', one: '1 min');
    return 'In $_temp0';
  }

  @override
  String viewScheduleMinutesOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min', one: '1 min');
    return '$_temp0 atraso';
  }

  @override
  String viewScheduleSecondsAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count seg', one: '1 segundo');
    return 'In $_temp0';
  }

  @override
  String viewScheduleSecondsOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count seg', one: '1 segundo');
    return '$_temp0 atraso';
  }

  @override
  String viewScheduleDate(String date, String clock) {
    return '$date $clock';
  }

  @override
  String viewScheduleYearDate(String year, String date, String clock) {
    return '$date, $year $clock';
  }

  @override
  String viewScheduleWeekdayName(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'Seg',
      '2': 'Ter',
      '3': 'Qua',
      '4': 'Qui',
      '5': 'Sex',
      '6': 'Sáb',
      'other': 'Dom',
    });
    return '$_temp0';
  }

  @override
  String viewReplayDate(String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Fev',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'Maio',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Out',
      '11': 'Nov',
      '12': 'Dez',
      'other': '$month',
    });
    return '$_temp0 $day';
  }

  @override
  String viewReplayHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count h', one: '1 h');
    return '$_temp0';
  }

  @override
  String viewReplayHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(hours, locale: localeName, other: '$hours h', one: '1 h');
    String _temp1 = intl.Intl.pluralLogic(minutes, locale: localeName, other: '$minutes min', one: '1 min');
    return '$_temp0 $_temp1';
  }

  @override
  String viewUiHundredMillion(String value) {
    return '${value}B';
  }

  @override
  String viewUiTenThousand(String value) {
    return '${value}K';
  }

  @override
  String viewUiMillion(String value) {
    return '${value}M';
  }

  @override
  String get viewListSeparator => ', ';

  @override
  String get viewAttachmentSeparator => ', ';

  @override
  String viewUiInvalidJsonOffset(String message, int offset) {
    return 'JSON inválido ($message, personagem próximo $offset)';
  }

  @override
  String get viewUiUnavailableChart => 'Não é possível exibir o gráfico';

  @override
  String get viewUiUnavailableMetric => 'Não é possível exibir a métrica';

  @override
  String get viewUiUnavailableCompare => 'Não é possível exibir a comparação';

  @override
  String get viewUiUnavailableSteps => 'Não é possível exibir os passos';

  @override
  String get viewUiUnavailableCallout => 'Não é possível exibir a nota';

  @override
  String get viewUiUnavailableOptions => 'Não é possível visualizar as opções';

  @override
  String get viewUiUnavailableConfirm => 'Não é possível exibir a confirmação';

  @override
  String get viewUiUnavailableText => 'Não é possível exibir o texto';

  @override
  String get viewUiUnavailableGroup => 'Não é possível exibir este grupo';

  @override
  String get viewUiUnavailablePart => 'Não é possível exibir esta seção';

  @override
  String viewScheduleSingleNextLabel(String title, String when) {
    return 'Automação: $title, Próximo $when';
  }

  @override
  String viewScheduleCountNextLabel(int count, String when) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count automação', one: '1 automação');
    return '$_temp0, Próximo $when';
  }

  @override
  String get viewUiSkippedStepLabel => 'Espera- se um texto; passo ignorado';

  @override
  String viewLabeledValue(String label, String value) {
    return '$label: $value';
  }

  @override
  String viewDescribedValue(String label, String description) {
    return '$label, $description';
  }

  @override
  String get viewSemicolonSeparator => '; ';

  @override
  String viewChartSemantics(String kind, String data) {
    return '$kind. $data';
  }

  @override
  String viewMetricSemantics(String label, String value) {
    return '$label $value';
  }

  @override
  String viewMetricCaptionSemantics(String label, String value, String caption) {
    return '$label $value, $caption';
  }

  @override
  String viewScheduleZone(String rule, String city, String offset) {
    return '$rule ($city · $offset)';
  }

  @override
  String viewContinueNotice(String text) {
    return '\n($text)\n';
  }

  @override
  String viewShareAltMarker(String alt) {
    return '[$alt]';
  }

  @override
  String get viewModelThinkingXhigh => 'Extra alta';

  @override
  String viewUiDialectWebOnly(String kind) {
    return '$kind · Ver na Web DSH';
  }

  @override
  String get viewUiDialectKindInteractive => 'Parte interactiva';

  @override
  String get viewUiDialectKindChart => 'Gráfico';

  @override
  String get viewUiDialectKindDiagram => 'Diagrama';

  @override
  String get viewUiDialectKindImage => 'Imagem';

  @override
  String get viewUiDialectKindAudio => 'Áudio';

  @override
  String get viewUiDialectKindVideo => 'Vídeo';

  @override
  String get viewUiDialectKindScene => 'Cena 3D';

  @override
  String get viewUiDialectKindFiles => 'Árvore de arquivos';

  @override
  String get viewUiDialectKindMap => 'Mapa';

  @override
  String get viewUiDialectKindOther => 'Esta parte';

  @override
  String get viewUiDialectInvalid => 'Este bloco aparece na Web DSH';

  @override
  String get viewUiDialectNote => 'Mostrado na Web DSH';

  @override
  String get voiceSettingsTitle => 'Entrada de voz';

  @override
  String get voiceModeAuto => 'Automático';

  @override
  String get voiceModeSystem => 'Sistema';

  @override
  String get voiceModeEngine => 'Modelo de voz';

  @override
  String get voiceModeAutoHint => 'Usa o modelo de voz quando estiver pronto, caso contrário o serviço do telefone';

  @override
  String get voiceModeSystemHint => 'Usar o serviço de reconhecimento selecionado neste celular';

  @override
  String get voiceModeEngineHint => 'Reconhece a fala com o modelo de voz do motor';

  @override
  String get voiceFallbackStarted => 'Mudou para o modelo de voz. Por favor, fale novamente.';

  @override
  String get voiceChooseSystem => 'Selecione um serviço de reconhecimento de fala nas configurações do sistema';

  @override
  String get voiceConfigureEngine => 'Baixe o modelo de voz em configurações de voz primeiro';

  @override
  String get voiceConfigureEither =>
      'O serviço do telefone não está disponível. Baixe o modelo de voz nas configurações de voz.';

  @override
  String get voiceErrorNetworkTimeout => 'O reconhecimento de fala acabou. Verifica a sua ligação.';

  @override
  String get voiceErrorNetwork => 'Não foi possível conectar o reconhecimento de fala à rede';

  @override
  String get voiceErrorAudio => 'A gravação de áudio falhou. Verifica o microfone.';

  @override
  String get voiceErrorServer => 'O serviço de fala do sistema falhou. Tente novamente mais tarde.';

  @override
  String get voiceErrorClient => 'Não foi possível iniciar o reconhecimento do sistema. Verifica o serviço de fala.';

  @override
  String get voiceErrorSpeechTimeout => 'Nenhuma fala foi detectada. Por favor, fale novamente.';

  @override
  String get voiceErrorNoMatch => 'Não percebi isso. Tente novamente.';

  @override
  String get voiceErrorBusy => 'O serviço de fala do sistema está ocupado. Tente novamente mais tarde.';

  @override
  String get voiceErrorPermission => 'Entrada de voz precisa de acesso ao microfone';

  @override
  String get voiceErrorTooManyRequests => 'Muitos pedidos de discursos. Tente novamente mais tarde.';

  @override
  String get voiceErrorDisconnected => 'O serviço de fala do sistema desconectado';

  @override
  String get voiceErrorLanguageUnsupported => 'O reconhecimento do sistema não suporta esta língua';

  @override
  String get voiceErrorLanguageUnavailable => 'Faça o download deste idioma no serviço de fala primeiro';

  @override
  String get voiceErrorSupportCheck => 'O serviço de fala não pode verificar o suporte de reconhecimento';

  @override
  String get voiceErrorDownloadEvents => 'O serviço de fala não pode relatar o progresso do download do modelo';

  @override
  String voiceErrorUnknown(int code) {
    return 'Erro no serviço de fala ${code}Tente outro serviço de reconhecimento.';
  }

  @override
  String get voiceSettingsFailed => 'Não foi possível ler as configurações da fala. Tente novamente.';

  @override
  String get voiceModeSection => 'Reconhecimento';

  @override
  String get voiceModelSection => 'Modelo de voz';

  @override
  String get voiceModelFooter =>
      'Uma vez baixado, chinês, inglês, cantonês, japonês e coreano são reconhecidos no telefone; as gravações permanecem nele.';

  @override
  String get voiceModelWaiting => 'Disponível uma vez que o motor está funcionando';

  @override
  String get voiceModelUnsupported => 'Este motor não tem modelo de voz';

  @override
  String get voiceModelAbsent => 'Não baixado';

  @override
  String get voiceModelDownloading => 'Baixando';

  @override
  String get voiceModelPreparing => 'Verificação e carregamento';

  @override
  String get voiceModelReady => 'Pronto';

  @override
  String get voiceModelFailed => 'A transferência falhou';

  @override
  String voiceModelBytes(String done, String total) {
    return '$done de $total';
  }

  @override
  String voiceModelReadyNote(String size) {
    return 'Usos $size; funciona offline';
  }

  @override
  String voiceModelAbsentNote(String size) {
    return 'Sobre $size para baixar';
  }

  @override
  String get voiceModelWaitingNote => 'O download começa uma vez que o motor está funcionando';

  @override
  String get voiceModelFailNetwork => 'Não foi possível alcançar a fonte de download';

  @override
  String get voiceModelFailTimeout => 'O download parou de fazer progresso';

  @override
  String get voiceModelFailCertificate => 'Falha na conexão segura; verifique a data do telefone';

  @override
  String get voiceModelFailServer => 'A fonte de download está indisponível por enquanto';

  @override
  String get voiceModelFailIntegrity => 'Os arquivos não passaram na verificação';

  @override
  String voiceModelFailStorage(String size) {
    return 'Não há armazenamento suficiente; sobre $size mais é necessário';
  }

  @override
  String get voiceModelFailEngine => 'O motor não respondeu';

  @override
  String get voiceModelFailUnknown => 'O download não terminou';

  @override
  String get voiceModelDownload => 'Baixar';

  @override
  String get voiceModelResume => 'Continuar';

  @override
  String get voiceModelRedownload => 'Re- download';

  @override
  String get voiceModelMeteredTitle => 'Baixar sobre dados móveis?';

  @override
  String voiceModelMeteredBody(String size) {
    return 'O modelo de voz é sobre $size e usará dados móveis.';
  }

  @override
  String get voiceModelDeleteTitle => 'Apagar o modelo de voz?';

  @override
  String get voiceModelDeleteBody =>
      'A entrada de voz irá usar o serviço do telefone. Você pode baixar o modelo novamente a qualquer momento.';

  @override
  String get voiceModelDeleteFailed => 'Não foi possível apagar o modelo de voz. Tente novamente.';

  @override
  String get voiceModelDeleteStopping => 'O download ainda está parando. Apaga outra vez num momento.';

  @override
  String voiceModelStartedToast(String size) {
    return 'Baixando o modelo de voz · about $size';
  }

  @override
  String voiceModelResumedToast(String size) {
    return 'Retomar o modelo de voz · sobre $size esquerda';
  }

  @override
  String get voiceModelReadyToast => 'A entrada de voz está pronta';

  @override
  String voiceModelFailedToast(String reason) {
    return 'Falha na transferência do modelo de voz: $reason';
  }

  @override
  String voiceModelNoticeDownloading(int percent) {
    return 'Baixando o modelo de voz $percent%';
  }

  @override
  String get voiceModelNoticePreparing => 'Verificar o modelo de voz';

  @override
  String get voiceModelNoticeFailed => 'O download do modelo de voz falhou. Abra o aplicativo para tentar novamente.';

  @override
  String get voiceScribeReadFailed => 'Não foi possível ler a configuração da voz. Tente novamente.';

  @override
  String get voiceScribeSavedReadFailed => 'Salvo. Atualizar para ver as configurações mais recentes.';

  @override
  String get voiceScribeSaveUnconfirmed => 'Não foi possível confirmar o salvamento. Atualizar ou tentar novamente.';

  @override
  String get voiceScribeTitle => 'Configuração da voz';

  @override
  String get voiceScribePolishPrompt => 'Fonte polaca';

  @override
  String get voiceScribeLanguage => 'Língua de reconhecimento';

  @override
  String get voiceScribeRefresh => 'Atualizar';

  @override
  String get voiceScribeHostChanged => 'A ligação mudou. Reabrir para continuar.';

  @override
  String get voiceScribeUnsupported => 'As configurações de voz não estão disponíveis nesta conexão.';

  @override
  String get voiceScribePluginDefault => 'Padrão';

  @override
  String get voiceScribeBuiltInPrompt => 'Prompt incorporado';

  @override
  String get voiceScribeProviders => 'Serviços de reconhecimento';

  @override
  String get voiceScribeKeySet => 'Chave definida';

  @override
  String get voiceScribeNoKey => 'Nenhuma chave';

  @override
  String get voiceScribeHotwords => 'Palavras quentes';

  @override
  String voiceScribeHotwordRules(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count regras', one: '1 regra');
    return '$_temp0';
  }

  @override
  String get wallpaperTitle => 'Papel de parede';

  @override
  String get wallpaperDefault => 'Padrão';

  @override
  String get wallpaperCustom => 'Personalizado';

  @override
  String get wallpaperFrame => 'Reposição';

  @override
  String get wallpaperBlur => 'Borrão';

  @override
  String get wallpaperLighten => 'Iluminar';

  @override
  String get wallpaperDim => 'Dim';

  @override
  String get wallpaperReplace => 'Substituir imagem';

  @override
  String get wallpaperPreview => 'Antevisão';

  @override
  String get wallpaperFooter =>
      'Mostrado em casa, nas conversas e na gaveta. O Lighten aplica- se no modo luz, diminua no modo escuro; o texto permanece sempre limpo. PNG, JPEG ou WebP, até 15 MB.';

  @override
  String get wallpaperChanged => 'Papel de parede alterado';

  @override
  String get wallpaperTooLarge => 'A imagem tem mais de 15 MB';

  @override
  String get wallpaperUnsupported => 'Usar um PNG, JPEG ou WebP';

  @override
  String get wallpaperUnreadable => 'Não foi possível ler esta imagem';

  @override
  String get wallpaperUnavailable => 'Não foi possível abrir suas fotos';

  @override
  String get wallpaperBroken => 'Não é possível ler';

  @override
  String get wallpaperEditorHint => 'Arrastar ou beliscar';

  @override
  String get wallpaperEditorReset => 'Reiniciar';

  @override
  String get wallpaperSampleTitle => 'Um fim de semana junto ao mar';

  @override
  String get wallpaperSampleStatus => 'Agora mesmo.';

  @override
  String get wallpaperSampleQuestion => 'Sábado é um bom dia para a praia?';

  @override
  String get wallpaperSampleAnswer =>
      'Sim. Sábado à tarde é ensolarado com uma brisa leve e ondas abaixo de meio metro, o melhor dia desta semana.';

  @override
  String get wallpaperSampleNote => 'Arrefece rápido à noite, por isso traz um casaco leve.';

  @override
  String get wallpaperSampleTool => 'Verificado 3 fontes meteorológicas';

  @override
  String get searchKwWallpaper => 'fundo, imagem de fundo, fundo do chat, fundo personalizado, fundo, blur, foto';

  @override
  String get webTitle => 'Web DSH';

  @override
  String get webSshAppOnly => 'Ligações de túnel SSH abertas apenas no aplicativo';

  @override
  String get webRelayUnavailable => 'DSH Web não está disponível através do DSH Remote. Abre-o no computador.';

  @override
  String get webSshHost => 'Máquina SSH';

  @override
  String get webLocalAppOnly => 'O link deste celular tem um token de lançamento e só abre no aplicativo';

  @override
  String get webEngineStatus => 'Estado do motor';

  @override
  String get webEngineStarting => 'Motor de arranque';

  @override
  String get webEngineStartFailed => 'Não foi possível ligar o motor';

  @override
  String get webEngineNotRunning => 'O motor não está em execução';

  @override
  String get webEngineProblem => 'O motor teve um problema';

  @override
  String get webStartingSoon => 'DSH Web estará pronto em um momento';

  @override
  String get webStartToOpen => 'Inicie o motor deste celular para abrir DSH Web';

  @override
  String get webRestart => 'Reiniciar';

  @override
  String get webStartEngine => 'Iniciar o motor';

  @override
  String get webSwitchToWeb => 'Mudar para a Web';

  @override
  String get webNativeFeatures => 'Características nativas';

  @override
  String get webSwitchToNative => 'Mudar para nativo';

  @override
  String get webAppSettings => 'Configuração da aplicativo';

  @override
  String get webSwitchHost => 'Mudar de máquina';

  @override
  String get webAttachmentTooLarge => 'O anexo é demasiado grande para o DSH Web';

  @override
  String get webTextCopied => 'Texto copiado. Colar na caixa de entrada.';

  @override
  String get webAttachmentFailed => 'Não foi possível adicionar anexos ao DSH Web';

  @override
  String get webHostUnavailable => 'DSH Web não está disponível neste host';

  @override
  String get webChatGone => 'Esta conversa desapareceu.';

  @override
  String get webPageClosed => 'Página encerrada';

  @override
  String get webChatsWorkspaces => 'Conversas e espaços de trabalho';

  @override
  String get webRefresh => 'Atualizar';

  @override
  String get webOpenInBrowser => 'Abrir no navegador';

  @override
  String get webBrowserUnavailable => 'Não é possível abrir no navegador';

  @override
  String get webReopen => 'Abrir de novo';

  @override
  String get webPageNotOpened => 'Não foi possível abrir a página';

  @override
  String get webCheckConnection => 'Verifique o status da sua rede ou do motor e tente novamente';

  @override
  String get webTargetSessionMissing => 'Não foi possível encontrar este chat no DSH Web. Você está na página inicial.';

  @override
  String get webTargetNotLoaded => 'DSH Web ainda não terminou de carregar';

  @override
  String get webTargetSettingsMissing =>
      'Não foi possível encontrar estas configurações. Você pode precisar entrar ou habilitar o plugin.';

  @override
  String get webTargetPluginMissing => 'Não foi possível encontrar este plugin. Pode estar a faltar neste perfil.';

  @override
  String get webTargetSidebarFailed =>
      'Não foi possível abrir a barra lateral. Abra esta conversa na DSH Web e tente novamente.';

  @override
  String get webTargetCordisMissing => 'Não foi possível encontrar o painel Cordis. O plugin pode ter sido removido.';

  @override
  String get webTargetNewChatFailed => 'Não foi possível iniciar uma conversa. Você está na página inicial do DSH Web.';

  @override
  String get webTargetPageFailed => 'Não foi possível abrir esta página. Você está na página inicial do DSH Web.';

  @override
  String webConnectHostFirst(String name) {
    return 'Conectar a “$name” para abrir o DSH Web';
  }
}
