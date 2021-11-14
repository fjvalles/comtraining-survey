User.create(first_name: 'Francisco', last_name: 'Vallés', role: :admin, email: 'fvalles@comtraining.cl', password: '123123123')

c1 = Company.find_or_create_by(name: 'Solex')

s1 = Survey.create(title: 'Estudio de clima laboral SOLEX Colombia Dic 2017',
                    start_date: DateTime.now,
                    end_date: DateTime.now + 2.days,
                    welcome_msg: 'El propósito de este cuestionario es conocer cuál es su opinión acerca del ambiente de trabajo en SOLEX COLOMBIA.
Le pedimos que aproveche esta oportunidad para hacer saber sus opiniones con absoluta libertad, pues se trata de una encuesta totalmente anónima y confidencial la cual es garantizada por la consultora quien entregará sólo resultados globales de las respuestas obtenidas sin detalles individuales.',
                    instructions: 'En las páginas siguientes encontrará cuatro preguntas demográficas y 72 afirmaciones respecto a su trabajo frente a las cuales deberá señalar su grado de acuerdo o desacuerdo con lo que ellas expresan. Al final se agregan dos preguntas más, que son abiertas.
Por ejemplo, en la afirmación:  “En la resolución de diferencias o conflictos, siempre en la empresa tratamos de encontrar soluciones que beneficien a todas las partes.”
Si con el contenido de esta afirmación está de acuerdo, marque como sigue:
RECUERDE:
1. Leer cuidadosamente cada pregunta o afirmación.
2. Marcar el círculo con la alternativa que represente mejor su manera de pensar.
3. Marcar sólo una alternativa en cada pregunta.
4. No se olvide de responder todas las preguntas.',
                    company: c1,
                    demographic_title: 'Preguntas demográficas',
                    questionaire_title: 'Cuestionario',
                    open_questions_title: 'Preguntas abiertas',
                    token: Devise.friendly_token.first(8),
                    goodbye_msg: 'Su encuesta ha sido completada y enviada satisfactoriamente. Gracias por su participación.')

q1 = Question.create(title: '¿Cuál es su antigüedad en la empresa?', q_type: :demo, scale: :n3, required: true, survey: s1, order:1)
Option.create(title: 'Menos de 2 años', question: q1, order: 1)
Option.create(title: 'Entre 2 y 3 años', question: q1, order: 2)
Option.create(title: 'Más de 3 años', question: q1, order: 3)
q2 = Question.create(title: '¿Cuál es su edad?', q_type: :demo, scale: :n3, required: true, survey: s1, order:2)
Option.create(title: 'Menos de 30 años', question: q2, order: 1)
Option.create(title: 'Entre 30 y 40 años', question: q2, order: 2)
Option.create(title: 'Más de 40 años', question: q2, order: 3)
q3 = Question.create(title: '¿Ejerce algún tipo de supervisión directa de personas?', q_type: :demo, scale: :n2, required: true, survey: s1, order:3)
Option.create(title: 'Sí', question: q3, order: 1)
Option.create(title: 'No', question: q3, order: 2)
q4 = Question.create(title: '¿A cuál área funcional pertenece?', q_type: :demo, scale: :n3, required: true, survey: s1, order:4)
Option.create(title: 'Área Comercial', question: q4, order: 1)
Option.create(title: 'Administración y Finanzas', question: q4, order: 2)
Option.create(title: 'Consultoría', question: q4, order: 3)
q5 = Question.create(title: 'El alcance de mi cargo está especificado adecuadamente', q_type: :hradio, scale: :n5, required: true, survey: s1, order:1)
Option.create(title: 'Muy de acuerdo', question: q5, order: 1)
Option.create(title: 'De acuerdo', question: q5, order: 2)
Option.create(title: 'Neutral', question: q5, order: 3)
Option.create(title: 'En desacuerdo', question: q5, order: 4)
Option.create(title: 'Muy en desacuerdo', question: q5, order: 5)
q6 = Question.create(title: 'El alcance de mi cargo está especificado adecuadamente', q_type: :hradio, scale: :n5, required: true, survey: s1, order:2)
Option.create(title: 'Muy de acuerdo', question: q6, order: 1)
Option.create(title: 'De acuerdo', question: q6, order: 2)
Option.create(title: 'Neutral', question: q6, order: 3)
Option.create(title: 'En desacuerdo', question: q6, order: 4)
Option.create(title: 'Muy en desacuerdo', question: q6, order: 5)
q6 = Question.create(title: '¿Qué consideras que es lo mejor de trabajar para SOLEX COLOMBIA?', q_type: :text, scale: :n1, required: true, survey: s1, order:1)
q7 = Question.create(title: 'Otros comentarios', q_type: :text, scale: :n1, required: true, survey: s1, order:2)
