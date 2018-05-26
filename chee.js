    let matrix;

    // Gets the optimal centre position of a array.
    function getCentreX(array) {
        const len = array.length;

        if (len % 2 === 0) {
            const secondI = len / 2;
            const second = array[secondI];

            const firstI = secondI - 1;
            const first = array[firstI];

            if (first > second)
                return firstI;

            return secondI;
        }

        return (len - 1) / 2;
    }

    // Gets the optimal centre position of a 2D array.
    function getCentre(array) {
        const len = array.length;

        if (len % 2 === 0) {
            const secondI = len / 2;
            const second = array[secondI];

            const firstI = secondI - 1;
            const first = array[firstI];

            const fCentreX = getCentreX(first);
            const sCentreX = getCentreX(second);

            if (first[fCentreX] > second[sCentreX])
                return { x: fCentreX, y: firstI };

            return { x: sCentreX, y: secondI }
        }

        const centreY = (len - 1) / 2;

        return { x: getCentreX(array[centreY]), y: centreY };
    }

    // Gets the value at the given position.
    function getValue(pos) {
        try {
            return matrix[pos.y][pos.x];
        } catch(e) {
            return undefined;
        }
    }

    function isBad(val) {
        return typeof val === "undefined" || val === null || Number.isNaN(val);
    }

    // Determines the most optimal position to move to.
    function getNext(pos) {
        let moves = [];

        const up = { x: pos.x, y: pos.y + 1 };
        up.value = getValue(up);
        moves.push(up);

        const down = { x: pos.x, y: pos.y - 1 };
        down.value = getValue(down);
        moves.push(down);

        const left = { x: pos.x - 1, y: pos.y };
        left.value = getValue(left);
        moves.push(left);

        const right = { x: pos.x + 1, y: pos.y };
        right.value = getValue(right);
        moves.push(right);

        moves.sort(function(a, b) {
            // console.log(a.value + ", " + b.value);

            if (a.value === b.value)
                return 0;

            if (isBad(a.value))
                return 1;

            if (isBad(b.value))
                return -1;

            return b.value - a.value;
        }); // Ascending order sort by value.

        // Set previous position to undefined.
        try {
            matrix[pos.y][pos.x] = undefined;
        } catch (e) {
            // do nothing?
        }

        return moves[0];
    }

    function play(m) {
        matrix = m;
        let cheese = 0;
        let currentPos = getCentre(matrix);
        currentPos.value = getValue(currentPos);

        do {
            cheese += currentPos.value;
            currentPos = getNext(currentPos);
        } while (typeof currentPos.value !== "undefined" && currentPos.value !== 0);

        return cheese;
    }